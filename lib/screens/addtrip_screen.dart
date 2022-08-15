import 'package:http/http.dart' as http;

import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/pickup_images.dart';

//import 'package:fluttermultipart/upload_page.dart';

class Addtrip extends StatefulWidget {
  //final String text;
  // const Addtrip({Key? key, required this.text}) : super(key: key);

  @override
  State<Addtrip> createState() => _AddtripState();
}

class _AddtripState extends State<Addtrip> {
  var driverimage;
  var drivername;
  var driverlastname;
  var arrivaladdress;
  var startdate;
  var arrivaldate;
  var notetrip;

  TextEditingController driverimageController = TextEditingController();
  TextEditingController drivernameController = TextEditingController();
  TextEditingController driverlastnameController = TextEditingController();
  TextEditingController arrivaladdressController = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController arrivaldateController = TextEditingController();
  TextEditingController notetripController = TextEditingController();

  addTrip() async {
    //String idtripe = widget.text;
    String link = 'https://silketappbackend.herokuapp.com/addtrip';
    try {
      var response = await http.post(Uri.parse(link), body: {
        "driverimage": driverimage.toString(),
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
          Padding(
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
          ),
          Padding(
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
          ),
          Container(
            // backgroundColor : Colors.green,
            child: CameraWidget(),
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
