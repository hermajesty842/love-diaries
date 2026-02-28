import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("profile")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: CircleAvatar(radius: 40, child: Icon(Icons.person)),
              title: Text("sign in"),
              subtitle: Text("Make everyday spent with your loved one count"),
            ),
            SizedBox(height: 20),

            myContainer(
              title: "Upgrade to pro",
              subtitle: "unlock all features",
              color1: Colors.purpleAccent,
              color2: Colors.pinkAccent,
            ),
            myContainer(
              title: "360 days Habit challange",
              subtitle: "Build a diary habit to get a gift from us",
              color1: Colors.purpleAccent,
              color2: Colors.pinkAccent,
              height: 100,
            ),
            myContainer(
              title: "No idea what to write",
              subtitle: "Dont worry take it easy,use one of our templates",
              color1: Colors.purpleAccent,
              color2: Colors.pinkAccent,
              textcolor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  myContainer({
    required String title,
    required String subtitle,
    required MaterialAccentColor color1,
    required MaterialAccentColor color2,
    Color textcolor = Colors.white,
    double height = 100,
  }) {
    return Container(
      width: double.infinity,
      height: height,
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(colors: [color1, color2]),
      ),
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        children:[
          Text(title,style:TextStyle(color:Colors.white,fontWeight:FontWeight.bold)),
          Text(subtitle,style:TextStyle(color:Colors.white70)),
        ],
      ),
    );
  }
}
