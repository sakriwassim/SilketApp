import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:posthindi_application/screens/details_command_screen.dart';

class Getcommand extends StatefulWidget {
  const Getcommand({Key? key}) : super(key: key);

  @override
  State<Getcommand> createState() => _GetcommandState();
}

class _GetcommandState extends State<Getcommand> {
  // this allows us to access the TextField text
  // TextEditingController textFieldController = TextEditingController();

  List commands = [];
  List<Map<String, dynamic>> _foundcommands = [];

  Future getTask() async {
    var url = Uri.parse('https://silketappbackend.herokuapp.com/commands');

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      commands.addAll(responsebody);
      commands = _foundcommands;
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

      body: Column(
        children: [
          const SizedBox(height: 20),
          const TextField(
            decoration:
                InputDecoration(labelText: "", suffixIcon: Icon(Icons.search)),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: _foundcommands.length,
              itemBuilder: (context, i) {
                return Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                AssetImage('assets/images/box.jpg'),
                          ),
                          title: Text("${commands[i]['name']}" +
                              " " +
                              "${commands[i]['lastname']}"),
                          subtitle: Column(
                            children: [
                              Text("${commands[i]['phone']}"),
                              // Text("${commands[i]['note']}"),
                              //Text("${commands[i]['Image']}"),
                            ],
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            child: const Text('BUY TICKETS'),
                            onPressed: () {
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
                          ),
                          const SizedBox(width: 8),
                          TextButton(
                            child: const Text('LISTEN'),
                            onPressed: () {/* ... */},
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ],
                  ),
                );

                /*TextButton(
                    child: Text("${commands[i]['name']}"),
                    onPressed: () {
                    });
          */
                //  Text("${tasks[i]['email']}");
              },
            ),
          ),
        ],
      ),
    );
  }
}
