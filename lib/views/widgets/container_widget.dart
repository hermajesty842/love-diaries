import 'package:flutter/material.dart';
//import 'package:lottie/lottie.dart';
// import 'package:love_diaries/views/pages/photos.dart';
import 'package:love_diaries/views/widgets/hero_widget.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: "LOVE DIARIES"),
          ],
        ),
      ),
    );
  }
}
