import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posthindi_application/constants.dart';
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
  // List<Map<String, dynamic>> _foundcommands = [];

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

        body: SafeArea(
            child: Column(
      children: [
        SizedBox(
          height: kDefaultPadding / 2,
        ),
        Expanded(
            child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 2,
              ),
              height: 190,
              color: Colors.green,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 166,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.red,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 15),
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ))
      ],
    ))

        /*
      SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const TextField(
              decoration:
                  InputDecoration(labelText: "", suffixIcon: Icon(Icons.search)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: commands.length,
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
      ),*/

        );
  }
}
