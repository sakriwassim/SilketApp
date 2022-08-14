import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/customer_details.dart';

class Details extends StatefulWidget {
  final String drivername;
  final String driverlastname;
  final String startaddress;
  final String arrivaladdress;
  final String startdate;
  final String arrivaldate;
  final String notetrip;

  const Details(
      {Key? key,
      required this.drivername,
      required this.driverlastname,
      required this.startaddress,
      required this.arrivaladdress,
      required this.startdate,
      required this.arrivaldate,
      required this.notetrip})
      : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('details'),
      ),
      body: Column(
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
          Padding(
            padding: EdgeInsets.all(15),
            child: Text(widget.drivername),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Text(widget.driverlastname),
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: ElevatedButton(
              onPressed: () {
                //   String text = text
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Customerdetails(
                        text: widget.drivername,
                      ),
                    ));
              },
              // postData,
              child: const Text('requests the service'),
            ),
          ),
        ],
      ),
    );
  }
}
