import 'package:flutter/material.dart';
import 'package:finance_calculator/ui/compound_calculator/label.dart';

class CompoundCalculatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: CompoundCalculatorLabel());
  }
}
