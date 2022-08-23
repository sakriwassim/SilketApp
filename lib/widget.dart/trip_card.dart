import 'package:flutter/material.dart';

import '../constants.dart';

class TripCard extends StatelessWidget {
  final String drivername;
  final String driverlastname;
  final String startaddress;
  final String arrivaladdress;
  final String startdate;
  final String arrivaldate;
  final String notetrip;

  //final Function callbackFunction;

  const TripCard(
      {Key? key,
      required this.drivername,
      required this.driverlastname,
      required this.startaddress,
      required this.arrivaladdress,
      required this.startdate,
      required this.arrivaldate,
      required this.notetrip

      // required this.callbackFunction
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        //color: Color.fromARGB(255, 255, 34, 233),
        margin: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
          // vertical: kDefaultPadding / 5,
        ),
        height: 190,
        // color: Colors.green,
        child: Stack(alignment: Alignment.bottomCenter, children: [
          Container(
            height: 166,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 15),
                      blurRadius: 25,
                      color: Colors.black12),
                ]),
          ),
          Positioned(
            top: 50,
            left: 10,
            child: Container(
              child: SizedBox(
                child: Container(
                  ///  color: Colors.red,
                  //padding: EdgeInsets.symmetric(
                  //   horizontal: kDefaultPadding * 3,
                  //     vertical: kDefaultPadding / 2),
                  height: 120,
                  width: 120,
                  child: CircleAvatar(
                    radius: 100,
                    backgroundImage: AssetImage('assets/images/image1.jpg'),
                  ),

                  // Image.asset('assets/images/image1.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            top: 40.0,
            right: 10,
            child: Container(
              //   color: Colors.blue,
              child: SizedBox(
                height: 136,
                width: size.width - 200,
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "drivername :$drivername",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "driverlastname :$driverlastname",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "startaddress :$startaddress",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "arrivaladdress :$arrivaladdress",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "startdate :$startdate",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "arrivaldate :$arrivaldate",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "notetrip :$notetrip",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]));
  }
}
