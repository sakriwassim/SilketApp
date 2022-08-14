import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Getcommand extends StatefulWidget {
  const Getcommand({Key? key}) : super(key: key);

  @override
  State<Getcommand> createState() => _GetcommandState();
}

class _GetcommandState extends State<Getcommand> {
  // this allows us to access the TextField text
  // TextEditingController textFieldController = TextEditingController();

  List commands = [];

  Future getTask() async {
    var url = Uri.parse('https://silketappbackend.herokuapp.com/commands');

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      commands.addAll(responsebody);
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
      body: //const MyStatelessWidget(),

          ListView.builder(
        itemCount: commands.length,
        itemBuilder: (context, i) {
          return TextButton(
              child: Text("${commands[i]['name']}"),
              onPressed: () {
                /* //_sendDataToSecondScreen(context);

                String textToSend = "${commands[i]['email']}";
                // textFieldController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Customerdetails(
                        text: textToSend,
                      ),
                    ));
              */
              });

          //  Text("${tasks[i]['email']}");
        },
      ),
    );
  }
}
