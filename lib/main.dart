import 'package:flutter/material.dart';
import 'pages/InputPage.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF090C21),
        scaffoldBackgroundColor: Color(0xFF090C21),
      ),
      home: InputPage(),
    );
  }
}

