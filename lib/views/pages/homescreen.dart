import 'dart:async';

import 'package:flutter/material.dart';
import 'package:love_diaries/views/pages/welcome_page.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
          ),
        ),
        Center(child: Image.asset('cool.jpg',width: 180,),),

        Align(
          alignment:Alignment.bottomCenter,
          child: Padding(padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              "Love diaries",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                letterSpacing: 2.0,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          ),
      ],
      ),
    );
  }
}
