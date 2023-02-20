import 'package:flutter/material.dart';

import 'package:studentpanel/student%20panel/constants/helpers.dart';
import 'package:studentpanel/student%20panel/dashboard/screens/dashboard.dart';

import 'hod panel/dashbaord/screens/hoddashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        canvasColor: canvasColor,
        scaffoldBackgroundColor: scaffoldBackgroundColor,
        textTheme:const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Poppins',
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: 48
          )
        )
      ),
      home: const HodDashboard(),
    );
  }
}
