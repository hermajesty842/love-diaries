import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? ischecked = false;
  bool isswitched = false;
  double slidervalue = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("settings")
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DropdownButton(items:[DropdownMenuItem(child: Text("key features"),),], onChanged:(value) {
              
            },),
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onEditingComplete: () => setState(() {}),
            ),
            Text(controller.text),
            // Checkbox(
            //   tristate: true,
            //   value: ischecked,
            //   onChanged: (bool? value) {
            //     setState(() {
            //       ischecked = value;
            //     });
            //   },
            // ),
            CheckboxListTile(
              tristate: true,
              title: Text("click"),
              value: ischecked,
              onChanged: (bool? value) {
                setState(() {
                  ischecked = value;
                });
              },
            ),
            // Switch(
            //   value: isswitched,
            //   onChanged: (bool value) {
            //     setState(() {
            //       isswitched = value;
            //     });
            //   },
            // ),
            SwitchListTile.adaptive(
              title: Text("turn on"),
              value: isswitched,
              onChanged: (bool value) {
                setState(() {
                  isswitched = value;
                });
              },
            ),
            Slider(
              max: 100.0,
              divisions: 20,
              value: slidervalue,
              onChanged: (double value) {
                setState(() {
                  slidervalue = value;
                });
                print(value.toString());
              },
            ),
            InkWell(
              splashColor: Colors.cyanAccent,
              onTap: () {
                print("my cartoon");
              },
              child: Container(
                color: Colors.white24,
                width: double.infinity,
                height: 50,
              ),
            ),
            OutlinedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,foregroundColor: Colors.blueAccent,
              ),
              child: Text("click me"),
            ),
          BackButton(),
          ],
        ),
      ),
    ),
    );
  
  }
}
