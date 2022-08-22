import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraWidget extends StatefulWidget {
  final String base64Imagesend;
  final Function callbackfunction;

  const CameraWidget(
      {Key? key, required this.base64Imagesend, required this.callbackfunction})
      : super(key: key);

  @override
  State createState() {
    // TODO: implement createState
    return CameraWidgetState();
  }
}

class CameraWidgetState extends State {
  PickedFile? imageFile = null;
  late final String base64Imagesend;

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Choose option",
              style: TextStyle(color: Colors.blue),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openGallery(context);
                    },
                    title: Text("Gallery"),
                    leading: Icon(
                      Icons.account_box,
                      color: Colors.blue,
                    ),
                  ),
                  Divider(
                    height: 1,
                    color: Colors.blue,
                  ),
                  ListTile(
                    onTap: () {
                      _openCamera(context);
                    },
                    title: Text("Camera"),
                    leading: Icon(
                      Icons.camera,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            child: (imageFile == null)
                ? Text("Choose Image")
                : Image.file(
                    File(imageFile!.path), height: 100,
                    //width: 100,
                  ),
          ),
          MaterialButton(
            textColor: Colors.white,
            color: Colors.pink,
            onPressed: () {
              _showChoiceDialog(context);
            },
            child: Text("Select Image"),
          )
        ],
      ),
    );
    //),
    // );
  }

  void _openGallery(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      imageFile = File(pickedFile!.path) as PickedFile?;

      final bytes = File(imageFile!.path).readAsBytesSync();
      String base64Image = "data:image/png;base64," + base64Encode(bytes);
      //print("************imageee******" + "img_pan : $base64Image");
    });

    Navigator.pop(context);
  }

  void _openCamera(BuildContext context) async {
    final pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
    );

    setState(() {
      imageFile = pickedFile!;

      final bytes = File(imageFile!.path).readAsBytesSync();
      String base64Image = base64Encode(bytes);
      //print(base64Image);

      base64Image = base64Imagesend;
    });
    Navigator.pop(context);
  }
}
