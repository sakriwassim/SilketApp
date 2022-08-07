import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/secondscreen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() {
    return _FirstScreenState();
  }
}

class _FirstScreenState extends State<FirstScreen> {

  // this allows us to access the TextField text
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              controller: textFieldController,
              style: TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),

          RaisedButton(
            child: Text(
              'Go to second screen',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _sendDataToSecondScreen(context);
            },
          )

        ],
      ),
    );
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context) {
    String textToSend = "textFieldController.text";
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SecondScreen(text: textToSend,),
        ));
  }
}