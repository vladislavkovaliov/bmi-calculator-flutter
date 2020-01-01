import 'package:flutter/material.dart';

import 'package:bmi_calculator/Constants/Constants.dart';

class IconContent extends StatelessWidget {
  IconContent({
    @required this.label,
    @required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          this.icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          this.label,
          style: LABEL_TEXT_STYLE,
        ),
      ],
    );
  }
}