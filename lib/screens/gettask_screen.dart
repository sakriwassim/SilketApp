import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:posthindi_application/screens/details_trip_screen.dart';
import 'dart:convert';

import 'package:posthindi_application/screens/update_screen.dart';
import 'package:posthindi_application/screens/customer_details_screen.dart';

import '../widget.dart/trip_card.dart';

class Gettask extends StatefulWidget {
  const Gettask({Key? key}) : super(key: key);

  @override
  State<Gettask> createState() => _GettaskState();
}

class _GettaskState extends State<Gettask> {
  // this allows us to access the TextField text
  // TextEditingController textFieldController = TextEditingController();

  List tasks = [];

  Future getTask() async {
    var url = Uri.parse('https://silketappbackend.herokuapp.com/trips');

    var response = await http.get(url);
    var responsebody = jsonDecode(response.body);

    setState(() {
      tasks.addAll(responsebody);
    });
    print(responsebody);
    print(tasks);
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
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          return GestureDetector(
            onTap: () {
              String drivername = "${tasks[i]['drivername']}";
              String driverlastname = "${tasks[i]['driverlastname']}";
              String startaddress = "${tasks[i]['startaddress']}";
              String arrivaladdress = "${tasks[i]['arrivaladdress']}";
              String startdate = "${tasks[i]['startdate']}";
              String arrivaldate = "${tasks[i]['arrivaldate']}";
              String notetrip = "${tasks[i]['notetrip']}";

              // textFieldController.text;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Details(
                        drivername: drivername,
                        driverlastname: driverlastname,
                        startaddress: startaddress,
                        arrivaladdress: arrivaladdress,
                        startdate: startdate,
                        arrivaldate: arrivaldate,
                        notetrip: notetrip),
                  ));
            },
            child: TripCard(
                drivername: "${tasks[i]['drivername']}",
                driverlastname: "${tasks[i]['driverlastname']}",
                startaddress: "${tasks[i]['startaddress']}",
                arrivaladdress: "${tasks[i]['arrivaladdress']}",
                startdate: "${tasks[i]['startdate']}",
                arrivaldate: "${tasks[i]['arrivaldate']}",
                notetrip: "${tasks[i]['notetrip']}"),
          );

          // return Card(
          //   child: Column(
          //     mainAxisSize: MainAxisSize.min,
          //     children: <Widget>[
          //       ListTile(
          //           leading: CircleAvatar(
          //             radius: 50,
          //             backgroundImage: AssetImage('assets/images/image1.jpg'),
          //           ),
          //           title: Text("${tasks[i]['drivername']}" +
          //               " " +
          //               "${tasks[i]['driverlastname']}"),
          //           subtitle: Column(
          //             children: [
          //               Text("${tasks[i]['startaddress']}" +
          //                   "" +
          //                   "${tasks[i]['arrivaladdress']}"),
          //               Text("${tasks[i]['startdate']}" +
          //                   "" +
          //                   "${tasks[i]['arrivaldate']}"),
          //             ],
          //           )),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.end,
          //         children: <Widget>[
          //           TextButton(
          //             child: const Text('BUY TICKETS'),
          //             onPressed: () {
          //               String drivername = "${tasks[i]['drivername']}";
          //               String driverlastname = "${tasks[i]['driverlastname']}";
          //               String startaddress = "${tasks[i]['startaddress']}";
          //               String arrivaladdress = "${tasks[i]['arrivaladdress']}";
          //               String startdate = "${tasks[i]['startdate']}";
          //               String arrivaldate = "${tasks[i]['arrivaldate']}";
          //               String notetrip = "${tasks[i]['notetrip']}";

          //               // textFieldController.text;
          //               Navigator.push(
          //                   context,
          //                   MaterialPageRoute(
          //                     builder: (context) => Details(
          //                         drivername: drivername,
          //                         driverlastname: driverlastname,
          //                         startaddress: startaddress,
          //                         arrivaladdress: arrivaladdress,
          //                         startdate: startdate,
          //                         arrivaldate: arrivaldate,
          //                         notetrip: notetrip),
          //                   ));
          //             },
          //           ),
          //           const SizedBox(width: 8),
          //           TextButton(
          //             child: const Text('LISTEN'),
          //             onPressed: () {/* ... */},
          //           ),
          //           const SizedBox(width: 8),
          //         ],
          //       ),
          //     ],
          //   ),
          // );

          /* TextButton(
              child: Text("${tasks[i]['email']}"),
              onPressed: () {
                //_sendDataToSecondScreen(context);

                String text = "${tasks[i]['email']}";
                // textFieldController.text;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        text: text,
                      ),
                    ));
              })*/

          //  Text("${tasks[i]['email']}");
        },
      ),
    );
  }
}
