import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:bmi_calculator/Widgets/ReusableCard.dart';
import 'package:bmi_calculator/Widgets/RoundIconButton.dart';
import 'package:bmi_calculator/Widgets/IconContent.dart';
import 'package:bmi_calculator/Widgets/Button.dart';
import 'package:bmi_calculator/Constants/Constants.dart';
import 'package:bmi_calculator/Pages/ResultPage.dart';
import 'package:bmi_calculator/Utils/Calculator.dart';

enum GenreType {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenreType selectedGender = GenreType.male;

  int height = 176;
  int weight = 60;
  int age = 22;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        this.selectedGender = GenreType.male;
                      });
                    },
                    color: this.selectedGender == GenreType.male
                      ? BLUE_DART_MEDIUM
                      : BLUE_DART_HARD,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'Male',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        this.selectedGender = GenreType.female;
                      });
                    },
                    color: this.selectedGender == GenreType.female
                      ? BLUE_DART_MEDIUM
                      : BLUE_DART_HARD,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'Female',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: BLUE_DART_MEDIUM,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Height',
                    style: LABEL_TEXT_STYLE,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        this.height.toString(),
                        style: NUMBER_TEXT_STYLE
                      ),
                      Text(
                        'cm',
                        style: LABEL_TEXT_STYLE,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTickMarkColor: Colors.white,
                      inactiveTickMarkColor: GREY,
                      thumbColor: RED,
                      overlayColor: RED_TRANSPARENT,
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 15.0,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 30.0,
                      ),
                    ),
                    child: Slider(
                      onChanged: (double newHeight) {
                        setState(() {
                          height = newHeight.round();
                        });
                      },
                      value: this.height.toDouble(),
                      min: 100.0,
                      max: 220.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: BLUE_DART_MEDIUM,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Weight',
                          style: LABEL_TEXT_STYLE,
                        ),
                        Text(
                          this.weight.toString(),
                          style: NUMBER_TEXT_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  this.weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  this.weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: BLUE_DART_MEDIUM,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Age',
                          style: LABEL_TEXT_STYLE,
                        ),
                        Text(
                          this.age.toString(),
                          style: NUMBER_TEXT_STYLE,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPress: () {
                                setState(() {
                                  this.age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPress: () {
                                setState(() {
                                  this.age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Button(
            text: 'Calculate',
            onTap: () {
              Calculator calc = Calculator(
                weight: this.weight,
                height: this.height,
              );
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ResultPage(
                  bmiResult: calc.getBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                )),
              );
            },
          ),
        ],
      ),
    );
  }
}
