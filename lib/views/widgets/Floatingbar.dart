import 'package:flutter/material.dart';
import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/pages/home_page.dart';
import 'package:love_diaries/views/pages/photos.dart';
import 'package:love_diaries/views/pages/settings_page.dart';
import 'package:love_diaries/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FloatingBar extends StatefulWidget {
  @override
  _FloatingBarState createState() => _FloatingBarState();
}

class _FloatingBarState extends State<FloatingBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love diaries'),
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
      
      body: _getPage(_currentIndex),
      // Floating the bar manually
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10, spreadRadius: 2),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                ),
                onPressed: () => setState(() => _currentIndex = 0),
              ),
              // The Pulsating Add Button
              ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.2).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
                ),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.add),
                  onPressed: () => setState(() => _currentIndex = 1),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.photo_library,
                  color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                ),
                onPressed: () => setState(() => _currentIndex = 2),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    if (index == 0) return Center(child: Text("Calendar Page"));
    if (index == 1) return HomePage();
    return Photos();
  }
}
