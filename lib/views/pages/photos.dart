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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // _image == null ? Text("No image selected",style: TextStyle(
              //   fontSize:20.0,
              //   color: CupertinoColors.systemGroupedBackground
              // ),) : Image.file(_image!),
              GestureDetector(
                onTap: _pickImageFromGallery,
              child: 
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: _pickImageFromGallery,
                child: Text("Add to diary"),
              ),
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
