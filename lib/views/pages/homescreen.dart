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
        Positioned(
          top: 20,
          left: 0,
          right: 0,
          child: Center(child:Text("Collecting moments,cherishing us",
        style:TextStyle(
          color:Colors.orange,
          fontSize:20,
          letterSpacing:2.0,
          fontWeight: FontWeight.w400,
        ),
        ),
        ),
        ),

        Align(
          alignment:Alignment.bottomCenter,
          child: Padding(padding: const EdgeInsets.only(bottom: 50.0),
            child: Text(
              "Love diaries",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 30,
                //letterSpacing: 2.0,
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
