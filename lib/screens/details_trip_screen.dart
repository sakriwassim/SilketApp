import 'package:flutter/material.dart';
import 'package:posthindi_application/constants.dart';
import 'package:posthindi_application/screens/customer_details_screen.dart';

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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        shadowColor: kBackgroundColor,
        elevation: 0.0,
        title: Text('details_trip_screen '),
      ),
      body: Container(
        color: kPrimaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding * 1.5),
              decoration: BoxDecoration(
                color: kBackgroundColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  //  horizontal: kDefaultPadding,
                  vertical: kDefaultPadding * 2,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      //   color: Colors.red,
                      child: Center(
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage:
                              AssetImage('assets/images/image1.jpg'),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: kDefaultPadding / 2),
                      child: Text("le nom choufeur : " +
                          "${widget.drivername}" +
                          " " +
                          "${widget.driverlastname}"),
                    ),
                    Text(
                      "Address depare : " +
                          "${widget.startaddress}" +
                          "Address de arrive " +
                          "${widget.arrivaladdress}",
                      // style: TextStyle(
                      //   fontSize: 28.0,
                      //   fontWeight: FontWeight.w600,
                      //   color: kSecondaryColor,
                      // ),
                    ),
                    SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
              padding: EdgeInsets.symmetric(
                horizontal: kDefaultPadding * 1.5,
                vertical: kDefaultPadding / 2,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("Address depare : " +
                        "${widget.startaddress}" +
                        "Address de arrive " +
                        "${widget.arrivaladdress}"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text("date de depare " +
                        "${widget.startdate}" +
                        " date darrive" +
                        "${widget.arrivaldate}"),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(widget.notetrip),
                  ),
                  ElevatedButton(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
