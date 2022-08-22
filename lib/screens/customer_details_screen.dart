import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posthindi_application/widget.dart/alertbox_widget.dart';
import 'package:posthindi_application/widget.dart/pickup_images.dart';

import '../widget.dart/getimageCard.dart';

class Customerdetails extends StatefulWidget {
  final String text;
  const Customerdetails({Key? key, required this.text}) : super(key: key);

  @override
  State<Customerdetails> createState() => _CustomerdetailsState();
}

class _CustomerdetailsState extends State<Customerdetails> {
  PickedFile? imageFile = null;

  String? Image64 = null;

  late String bytes64;
  var name;
  var lastname;
  var phone;
  var note;
  var Image;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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

  addCommand() async {
    //String idtripe = widget.text;
    String link = 'https://silketappbackend.herokuapp.com/addcommand/';
    try {
      var response = await http.post(Uri.parse(link), body: {
        "name": name.toString(),
        "lastname": lastname.toString(),
        "phone": phone.toString(),
        "note": note.toString(),
        "Image": Image.toString(),
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //PickedFile? imageFile = null;
    // String? Image64 = null;

    return Scaffold(
      appBar: AppBar(title: Text("Add command")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.text),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'nom',
                hintText: 'Entre votre nom',
              ),
              onChanged: (text) {
                print('First text field: $text');
                name = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: lastnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prenom',
                hintText: 'Enter voter Prenom',
              ),
              onChanged: (text) {
                print('First text field: $text');
                lastname = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de telephone',
                hintText: 'Enter votre Nbr de telephone',
              ),
              onChanged: (text) {
                // print('First text field: $text');
                phone = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: noteController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'remarque',
                hintText: 'Enter une remarque',
              ),
              onChanged: (text) {
                print('First text field: $text');
                note = text;
              },
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              getimageCard(imageFile: imageFile),
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
          ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('êtes-vous sûr!!'),
                content: const Text('demander le service'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Cancel'),
                  ),
                  TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context, 'OK');
                        addCommand();
                      }),
                ],
              ),
            ),
            child: const Text('**save**'),
          ),
        ],
      ),
    );
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
      // String base64Image = base64Encode(bytes);

      String base64Image = base64Encode(bytes);
      String imagename = pickedFile.path.split("/").last;

      Image64 = imagename;

      print(imagename);
    });
    Navigator.pop(context);
    // return base64Image;
  }
}
