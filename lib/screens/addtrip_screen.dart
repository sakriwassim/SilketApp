import 'dart:convert';

import 'package:http/http.dart' as http;

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addtrip extends StatefulWidget {
  @override
  State<Addtrip> createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
  PickedFile? imageFile = null;
  String? Image64 = null;
  // late final String base64Imagesend;
  //var Image64;
  var driverimage;
  var drivername;
  var driverlastname;
  var arrivaladdress;
  var startdate;
  var arrivaldate;
  var notetrip;
  // var base64Image;

  TextEditingController driverimageController = TextEditingController();
  TextEditingController drivernameController = TextEditingController();
  TextEditingController driverlastnameController = TextEditingController();
  TextEditingController arrivaladdressController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController arrivaldateController = TextEditingController();
  TextEditingController notetripController = TextEditingController();

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

  addTrip() async {
    //String idtripe = widget.text;
    String link = 'https://silketappbackend.herokuapp.com/addtrip';
    try {
      var response = await http.post(Uri.parse(link), body: {
        "driverimage": Image64.toString(),
        "drivername": drivername.toString(),
        "driverlastname": driverlastname.toString(),
        "arrivaladdress": arrivaladdress.toString(),
        "startdate": startdate.toString(),
        "arrivaldate": arrivaldate.toString(),
        "notetrip": notetrip.toString()
      });
      print(response.body);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add command")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Text(widget.driverimage),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: driverimageController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'nom',
                hintText: 'Entre votre nom',
              ),
              onChanged: (text) {
                print('First text field: $text');
                driverimage = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: drivernameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prenom',
                hintText: 'Enter voter Prenom',
              ),
              onChanged: (text) {
                print('First text field: $text');
                drivername = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: driverlastnameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nombre de telephone',
                hintText: 'Enter votre Nbr de telephone',
              ),
              onChanged: (text) {
                // print('First text field: $text');
                driverlastname = text;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: arrivaladdressController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'remarque',
                hintText: 'Enter une remarque',
              ),
              onChanged: (text) {
                print('First text field: $text');
                arrivaladdress = text;
              },
            ),
          ),
          /*  Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: startdateController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'remarque',
                hintText: 'Enter une remarque',
              ),
              onChanged: (text) {
                print('First text field: $text');
                startdate = text;
              },
            ),
          ),*/
          /* Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: notetripController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'remarque',
                hintText: 'Enter une remarque',
              ),
              onChanged: (text) {
                print('First text field: $text');
                notetrip = text;
              },
            ),
          ),*/
          Column(
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
                        addTrip();

                        print(Image64);
                      }),
                ],
              ),
            ),
            child: const Text('**save**'),

            /*
              child: const Text('**save**'),
              onPressed: () {
                AlertboxWidget();
              }
              //  addCommand,
              */
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

      String base64Image = "data:image/png;base64," + base64Encode(bytes);

      Image64 = base64Image;

      print(base64Image);
    });
    Navigator.pop(context);
    // return base64Image;
  }
}
