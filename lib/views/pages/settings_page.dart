import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;

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
    return Scaffold(
      appBar: AppBar(title: Text("wigdet.title")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton(
                items: [
                  DropdownMenuItem(child: Text("key features 2")),
                ],
                onChanged: (value) {},
              ),
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
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("snackbar"),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.blueAccent,
                ),
                child: Text("snack bar"),
              ),
              Divider(
              color:Colors.blueAccent,
              thickness: 5.0,
              // ndIndent: 200.0,
            ),
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog();
                    },
                  );
                },
                child: Text("open dialog"),
              ),
            Divider(
              color:Colors.blueAccent,
              thickness: 5.0,
              // ndIndent: 200.0,
            ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Alert title"),
                        content: Text("content"),
                        actions: [
                          OutlinedButton(onPressed: () {
                         Navigator.pop(context);
                          }, 
                          child: Text("close"),),
                        ],
                      );
                    },
                  );
                },
                child: Text("Alert dialog"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
