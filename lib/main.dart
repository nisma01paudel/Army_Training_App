import 'package:armyapp/app_config.dart';
import 'package:armyapp/views/home_screen.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green, // Set the primary color
        primaryColor: Colors
            .green[900], // Set a specific shade of green as the primary color
      ),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
