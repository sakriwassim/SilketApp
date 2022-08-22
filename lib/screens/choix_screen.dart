import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/addtrip_screen.dart';
import 'package:posthindi_application/screens/bottom_nav_bar.dart';

class Choice extends StatefulWidget {
  @override
  _ChoiceState createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter FlatButton Example'),
          ),
          body: Center(
              child: Column(children: <Widget>[
            Container(
              margin: EdgeInsets.all(25),
              child: Text(
                'choisir ',
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            TextButton(
                child: Text("Clien"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/MyHomePage');
                }),
            TextButton(
                child: Text("Choufeur"),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/Addtrip');
                }),
          ]))),
    );
  }
}
