import 'package:flutter/material.dart';

import '../constants.dart';

class CommandCard extends StatelessWidget {
  final String name;
  final String lastname;
  final String phone;
  final String note;
  //final Function callbackFunction;

  const CommandCard({
    Key? key,
    required this.name,
    required this.lastname,
    required this.phone,
    required this.note,
    // required this.callbackFunction
  }) : super(key: key);

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
                    backgroundImage: AssetImage('assets/images/box.jpg'),
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
                        "name :$name",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "lastname :$lastname",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "phone :$phone",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "note :$note",
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
