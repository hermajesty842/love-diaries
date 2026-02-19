// import 'dart:async';

import 'package:flutter/material.dart';


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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: BoxDecoration(
            image: 
            DecorationImage(image: 
            AssetImage("assets/images/background.jpg"),fit: BoxFit.cover)
          ),
        ),
        Center(child:Text("Collecting moments,cherishing us",
        style:TextStyle(
          color:Colors.purple,
          fontSize:50,
          letterSpacing:2.0,
          fontWeight: FontWeight.w400,
        ),
        ),),

        Align(
          alignment:Alignment.bottomCenter,
          child: Padding(padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              "Love diaries",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
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
