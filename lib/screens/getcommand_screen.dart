import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posthindi_application/constants.dart';
import 'dart:convert';

import 'package:posthindi_application/screens/details_command_screen.dart';

import '../widget.dart/Commandcard.dart';

class Getcommand extends StatefulWidget {
  const Getcommand({Key? key}) : super(key: key);

  @override
  State<Getcommand> createState() => _GetcommandState();
}

class _GetcommandState extends State<Getcommand> {
  List commands = [];

  Future getTask() async {
    var url = Uri.parse('https://silketappbackend.herokuapp.com/commands');

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      commands.addAll(responsebody);
      // commands = _foundcommands;
    });
    print(responsebody);
    print(commands);
  }

  @override
  void initState() {
    getTask();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  appBar: AppBar( title: Text('getcompteur'), ),

      body: Container(
        color: kBackgroundColor,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                    labelText: "", suffixIcon: Icon(Icons.search)),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: commands.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                        onTap: () {
                          String name = "${commands[i]['name']}";
                          String lastname = "${commands[i]['lastname']}";
                          String phone = "${commands[i]['phone']}";
                          String note = "${commands[i]['note']}";
                          String Image = "${commands[i]['Image']}";

                          // textFieldController.text;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detailscommand(
                                    name: name,
                                    lastname: lastname,
                                    phone: phone,
                                    note: note,
                                    Image: Image),
                              ));
                        },
                        child: CommandCard(
                          name: "${commands[i]['name']}",
                          lastname: "${commands[i]['lastname']}",
                          phone: "${commands[i]['phone']}",
                          note: "${commands[i]['note']}",
                          //callbackFunction: callback
                          // Image:"${commands[i]['Image']}"
                        ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
