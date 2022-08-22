import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/addtrip_screen.dart';

import 'package:posthindi_application/screens/bottom_nav_bar.dart';
import 'package:posthindi_application/screens/choix_screen.dart';
import 'package:posthindi_application/screens/customer_details_screen.dart';
import 'package:posthindi_application/screens/details_trip_screen.dart';
import 'package:posthindi_application/screens/getcommand_screen.dart';
import 'package:posthindi_application/screens/gettask_screen.dart';
import 'package:posthindi_application/screens/login_screen.dart';
import 'package:posthindi_application/widget.dart/pickup_images.dart';
import 'package:posthindi_application/screens/update_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Named Routes Demo',
    initialRoute: '/MyHomePage',
    routes: {
      '/': (context) => Choice(),
      '/MyHomePage': (context) => MyHomePage(),
      '/Addtrip': (context) => Addtrip(),
      //  '/Getcommand': (context) => Getcommand(),
    },
  ));
}
