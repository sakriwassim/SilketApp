import 'package:flutter/material.dart';
import 'package:posthindi_application/screens/firstscreen.dart';
import 'package:posthindi_application/screens/gettask_screen.dart';
import 'package:posthindi_application/screens/login_screen.dart';
import 'package:posthindi_application/screens/update_screen.dart';

void main() { 
   runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Gettask(),
  ));
}