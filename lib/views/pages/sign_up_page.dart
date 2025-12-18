import 'package:flutter/material.dart';
import 'package:love_diaries/views/pages/login_page.dart';
import 'package:love_diaries/views/widgets/hero_widget.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController controllername = TextEditingController();
  TextEditingController controlleremail = TextEditingController();
  TextEditingController controllerpassword = TextEditingController();
  TextEditingController controllerpassword2 = TextEditingController();
  bool? ischecked = false;
  String name = "hildakinya";
  String email = "hildakinya@gmail.com";
  String password = "kishy";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeroWidget(title: "Signup"),
              SizedBox(height: 20.0),
              TextField(
                controller: controllername,
                decoration: InputDecoration(
                  hintText: "fullname",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: controlleremail,
                decoration: InputDecoration(
                  hintText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: controllerpassword,
                decoration: InputDecoration(
                  hintText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: controllerpassword2,
                decoration: InputDecoration(
                  hintText: "confirm password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                onEditingComplete: () => setState(() {}),
              ),
              SizedBox(height: 20.0),
              FilledButton(
                onPressed: () {
                  onsignuppressed();
                },
                style: FilledButton.styleFrom(
                  minimumSize: Size(double.infinity, 40.0),
                ),
                child: Text("Signup"),
              ),
              CheckboxListTile(
                title: Text("remember me"),
                value: ischecked,
                onChanged: (bool? value) {
                  setState(() {
                    ischecked = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void onsignuppressed() {
    if(name == controllername.text && email == controlleremail.text && password == controllerpassword.text ){
      Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginPage();
                      },
                    ),
                  );
    }
  }
}
