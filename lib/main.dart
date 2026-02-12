import 'package:flutter/material.dart';
import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:love_diaries/views/pages/homescreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initthememode();
    super.initState();
  }

  void initthememode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool('kconstants.thememodekey');
    isdarkmodenotifier.value=repeat ?? false; 
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isdarkmodenotifier,
      builder: (context, isdarkmode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 112, 90, 146),
              brightness: isdarkmode ? Brightness.dark : Brightness.light,
            ),
          ),

          home: WelcomePage(),
        );
      },
    );
  }
}
