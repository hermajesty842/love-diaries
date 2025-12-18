import 'package:flutter/material.dart';
import 'package:love_diaries/views/widgets/hero_widget.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child:Column
      (children: [HeroWidget(title: "LOVE DIARIES",), 
      Padding(padding: EdgeInsets.symmetric(vertical: 8.0),
    child: Card(child: Padding(padding:EdgeInsets.all(50.0),
    child: 
    Column(
      children: [
        Text("Basic layout",
        style: TextStyle(
          fontSize: 20.0,
          fontWeight:FontWeight.w900,
          color: Colors.green,
        ),
        ),
        Text("content of this page"),
      ],
    ),

    ),
    
    ),
      ),
      ],
      ),
    );
  }
}