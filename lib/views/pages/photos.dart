import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class Photos extends StatefulWidget {
  const Photos({super.key});

  @override
  State<Photos> createState() => _PhotosState();
}

class _PhotosState extends State<Photos> {
  File? _image;
  TextEditingController controller = TextEditingController();
  final picker = ImagePicker();

  //GestureTapCallback? get _getimage => null;
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? Controller;
    return Scaffold(
      appBar: AppBar(title: Text("Add a memory")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              _image == null ? Text("No image selected",style: TextStyle(
                fontSize:20.0,
                color: CupertinoColors.systemGroupedBackground
              ),) : Image.file(_image!),
              GestureDetector(
                onTap: _pickImageFromGallery,
                child: Container(
                  height: 50.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.deepPurpleAccent,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: ShaderMask(
                    shaderCallback: (rect) => LinearGradient(
                      colors: [Colors.deepPurple, Colors.blueAccent],
                    ).createShader(rect),
                    // TweenAnimationBuilder(
                    //   duration: Duration(seconds: 1),
                    //   tween: Tween<double>(begin: 0,end:0),
                    //   builder: (BuildContext context, double value,child) {
                    //     return Opacity(opacity: value,);
                    //   },
                    // ),
                    child: Text(
                      "Tap to select a photo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: Colors.amber,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: _pickImageFromGallery,
                child: Text("add to diary"),
              ),
              SizedBox(height: 15.0),
              TextField(
                controller: Controller,
                decoration: InputDecoration(
                  hintText: "what made this moment special?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
