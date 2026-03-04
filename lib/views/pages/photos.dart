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
  File? image;
  TextEditingController controller = TextEditingController();
  final picker = ImagePicker();

  //GestureTapCallback? get _getimage => null;
  Future<void> _pickImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
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
               ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: _pickImageFromGallery,
                child: Text("Add to diary"),
              ),
              SizedBox(height: 5.0),
              image == null ? Text("select Image",style: TextStyle(
                fontSize:20.0,
                color: const Color.fromARGB(255, 8, 8, 14)
              ),) 
              : ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(8),
                child: Image.file(image!)),          
              SizedBox(height: 15.0),
              (
             TextButton(onPressed: ()=>setState(()=>image=null), child: Text('Remove image'))
            ),
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
