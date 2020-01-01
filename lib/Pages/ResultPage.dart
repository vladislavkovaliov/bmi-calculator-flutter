import 'package:flutter/material.dart';

import 'package:bmi_calculator/Pages/InputPage.dart';
import 'package:bmi_calculator/Widgets/ReusableCard.dart';
import 'package:bmi_calculator/Widgets/Button.dart';
import 'package:bmi_calculator/Constants/Constants.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calcalator'
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: RESULT_TITLE_TEXT_STYLE,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              color: BLUE_DART_MEDIUM,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    this.resultText,
                    style: RESULT_TEXT_STYLE,
                  ),
                  Text(
                    this.bmiResult,
                    style: RESULT_BMI_TEXT_STYLE,
                  ),
                  Text(
                    this.interpretation,
                    textAlign: TextAlign.center,
                    style: RESULT_BODY_TEXT_STYLE,
                  ),
                ],
              ),
            ),
          ),
          Button(
            onTap: () {
              Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => InputPage()),
              );
            },
            text: 'Re-Calculate',
          )
        ],
      ),
    );
  }
}
