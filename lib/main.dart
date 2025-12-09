import 'package:flutter/material.dart';
import 'package:love_diaries/data/notifiers.dart';
import 'package:love_diaries/views/widget_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isdarkmodenotifier,
      builder: (context, isdarkmode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Love diaries',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 112, 90, 146),
              brightness: isdarkmode ? Brightness.dark : Brightness.light,
            ),
          ),

          home: WidgetTree(),
        );
      },
    );
  }
}
