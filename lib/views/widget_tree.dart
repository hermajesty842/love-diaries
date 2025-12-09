import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/pages/home_page.dart';
import 'package:love_diaries/views/pages/profile_page.dart';
import 'package:love_diaries/views/pages/settings_page.dart';

import 'package:love_diaries/views/widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () {
              isdarkmodenotifier.value = !isdarkmodenotifier.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: isdarkmodenotifier,
              builder: (context, isdarkmode, child) {
                return Icon(isdarkmode ? Icons.dark_mode : Icons.light_mode);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("More details")),
            ListTile(title: Text("log out")),
          ],
        ),
      ),
      bottomNavigationBar: NavbarWidget(
        currentIndex: currentIndex,
        changeState: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),

      floatingActionButton: InkWell(
        splashColor: Colors.pink,
        child: FloatingActionButton(
          onPressed: () {
            debugPrint("add a moment");
          },
          child: FaIcon(
            FontAwesomeIcons.handHoldingHeart,
            color: (Colors.pink),
          ),
        ),
      ),

      body: pages[currentIndex],
    );
  }
}
