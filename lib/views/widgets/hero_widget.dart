import 'package:flutter/material.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key, required this.title,
  this.nextpage
  });

  final String title;
  final Widget? nextpage;                   

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() {
        
      } ,
      child: Stack (
        alignment: Alignment.center,
        children: [
          Hero(
            tag: 'hero 1',
            child: ClipRRect(
              borderRadius: BorderRadius.circular(60.0),
              child: Image.asset(
                "assets/images/mine.webp",
                width: double.infinity,
                fit: BoxFit.cover,
                color: Colors.cyan,
                colorBlendMode: BlendMode.darken,
              ),
            ),
          ),
          FittedBox(
            child: Text(title,style: TextStyle(fontWeight: FontWeight.bold,
            fontSize: 30.0,
            color: Colors.white70,
            letterSpacing: 2.0,
            fontStyle: FontStyle.italic,
            ),),
          ),
        ],
      ),
    );
  }
}
