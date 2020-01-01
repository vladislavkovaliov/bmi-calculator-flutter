import 'package:flutter/material.dart';

import 'package:bmi_calculator/Constants/Constants.dart';

class Button extends StatelessWidget {
  Button({
    @required this.onTap,
    @required this.text,
  });

  final Function onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Container(
        child: Center(
          child: Text(
            this.text,
            style: BUTTON_TEXT_STYLE,
          ),
        ),
        color: RED,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
        width: double.infinity,
        height: BTN_CONTAINER_HEIGHT,
      ),
    );
  }
}