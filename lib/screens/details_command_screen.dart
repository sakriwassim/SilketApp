import 'package:flutter/material.dart';

class Detailscommand extends StatefulWidget {
  final String name;
  final String lastname;
  final String phone;
  final String note;
  final String Image;

  const Detailscommand(
      {Key? key,
      required this.name,
      required this.lastname,
      required this.phone,
      required this.note,
      required this.Image})
      : super(key: key);

  @override
  State<Detailscommand> createState() => _DetailscommandState();
}

class _DetailscommandState extends State<Detailscommand> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details de command'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Image.asset

            Padding(
              padding: EdgeInsets.all(15),
              child: CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/image1.jpg'),
              ),
            ),

            /*
                Image.asset(
                  'assets/images/image1.jpg',
                  height: 400,
                  width: 400,
                ),
            */
            Center(
              child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Text("nom de client : " +
                      "${widget.name}" +
                      " " +
                      "${widget.lastname}")),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Text("phone : " + "${widget.phone}"),
            ),

            Padding(
              padding: EdgeInsets.all(15),
              child: Text("note" + "${widget.note}"),
            ),
          ],
        ),
      ),
    );
  }
}
