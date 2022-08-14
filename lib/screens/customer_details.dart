//import 'package:flutter/material.dart';
//import 'dart:io';
//import 'dart:ffi';
//import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:posthindi_application/screens/alertbox_widget.dart';
import 'package:posthindi_application/screens/pickup_images.dart';

//import 'package:fluttermultipart/upload_page.dart';

class Customerdetails extends StatefulWidget {
  final String text;
  const Customerdetails({Key? key, required this.text}) : super(key: key);

  @override
  State<Customerdetails> createState() => _CustomerdetailsState();
}

class _CustomerdetailsState extends State<Customerdetails> {
  var name;
  var lastname;
  var phone;
  var note;
  var Image;

  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController noteController = TextEditingController();

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
      print("silketapp");
    }
  }

  @override
  Widget build(BuildContext context) {
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
          Container(
            // backgroundColor : Colors.green,
            child: CameraWidget(),
          ),
          ElevatedButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('AlertDialog Title'),
                content: const Text('AlertDialog description'),
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
}
