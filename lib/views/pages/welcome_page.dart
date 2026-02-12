import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:love_diaries/views/pages/login_page.dart';
import 'package:love_diaries/views/pages/sign_up_page.dart'; 


class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          spacing:12.0,
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
          //  HeroWidget(title: "love diaries"),
           Lottie.asset("assets/lotties/wave.json",height: MediaQuery.of(context).size.height * 0.5),
            FilledButton(onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SignUpPage();
                  },
                ),
              );
            },
            style:FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0),), 
            child: Text("sign up"),
            ),
              OutlinedButton(onPressed:() {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ),
              );
            }, 
            style:FilledButton.styleFrom(minimumSize: Size(double.infinity, 40.0),),
            child: Text("login"),),
          ],
        ),
      ),
    );
  }
}
