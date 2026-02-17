//import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/pages/calendar.dart';
import 'package:love_diaries/views/pages/home_page.dart';
import 'package:love_diaries/views/pages/settings_page.dart';
import 'package:love_diaries/views/pages/welcome_page.dart';
import 'package:love_diaries/views/pages/photos.dart';
// import 'package:love_diaries/views/widgets/Floatingbar.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:speech_to_text/speech_to_text.dart';

List<Widget> pages = [HomePage(), Photos(),Calendar()];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('love diaries'),
        centerTitle: true,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            onPressed: () async {
              isdarkmodenotifier.value = !isdarkmodenotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                'kconstants.thememodekey',
                isdarkmodenotifier.value,
              );
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
                    return SettingsPage(title: "Settings Page");
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
            DrawerHeader(
              child: CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.blue,
                backgroundImage: AssetImage('assets/images/heart.jpg'),
              ),
            ),
            ListTile(
              title: Text("log out"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomePage();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: FloatingBar(
      //   currentIndex: currentIndex,
      //   changeState: (tappedicon) {
      //     setState(() {
      //       currentIndex = tappedicon;
      //     });
      //   },
      // ),

      body: pages[currentIndex],
    );
  }
}
