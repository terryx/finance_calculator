import 'package:flutter/material.dart';

class CompoundCalculatorLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text(
              "Principal Amount:",
              style: getLabelStyle(),
            ),
            Text(
              "Interest Rate:",
              style: getLabelStyle(),
            ),
            Text("Investment Length:", style: getLabelStyle()),
          ],
        )
      ],
    );
  }

  TextStyle getLabelStyle() {
    return TextStyle(
        color: Colors.black87,
        decoration: TextDecoration.none,
        fontFamily: "Fira",
        fontSize: 20.0,
        height: 1.1);
  }
}
