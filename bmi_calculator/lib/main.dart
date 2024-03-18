import 'package:bmi_calculator/Page%2001.dart';
import 'package:bmi_calculator/homePage.dart';
import 'package:bmi_calculator/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BMI_Calculator(),
    );
  }
}
