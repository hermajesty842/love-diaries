import 'package:flutter/material.dart';
import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/pages/calendar.dart';
import 'package:love_diaries/views/pages/home_page.dart';
import 'package:love_diaries/views/pages/homescreen.dart';
import 'package:love_diaries/views/pages/mydrawer.dart';
import 'package:love_diaries/views/pages/photos.dart';
import 'package:love_diaries/views/pages/profile_page.dart';
import 'package:love_diaries/views/pages/settings_page.dart';
// import 'package:love_diaries/views/pages/mydrawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Floatingbar extends StatefulWidget {
  const Floatingbar({super.key});

  @override
  FloatingBarState createState() => FloatingBarState();
}

class FloatingBarState extends State<Floatingbar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  int _currentIndex = 0;

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
        backgroundColor: Colors.lightBlue,
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
      drawer: Mydrawer(),
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
                icon: Icon(Icons.home),
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                onPressed: () => setState(() => _currentIndex = 0),
              ),
              IconButton(
                icon: Icon(
                  Icons.calendar_today,
                  color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                ),
                onPressed: () => setState(() => _currentIndex = 1),
              ),
              // The Pulsating Add Button
              ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.2).animate(
                  CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
                ),
                child: FloatingActionButton(
                  elevation: 0,
                  backgroundColor: Colors.pink,
                  child: Icon(Icons.add),
                  onPressed: () => setState(() => _currentIndex = 2),
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.photo_library,
                  color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                ),
                onPressed: () => setState(() => _currentIndex = 3),
              ),
              IconButton(
                icon: Icon(
                  Icons.person_2_outlined,
                  color: _currentIndex == 4 ? Colors.blue : Colors.grey,
                ),
                onPressed: () => setState(() => _currentIndex = 4),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getPage(int index) {
    if (index == 0) return Homescreen();
    if (index == 1) return Calendar();
    if (index == 2) return HomePage();
    if (index == 3) return Photos();
    return ProfilePage();
  }
}
