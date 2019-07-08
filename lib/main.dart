import 'package:flutter/material.dart';
// import 'package:finance_calculator/ui/compound_calculator/main.dart';
import 'package:finance_calculator/ui/compound_calculator/form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Finance Calculator",
      home: Scaffold(
          appBar: AppBar(title: Text("Compound Calculator")),
          body: new CompoundCalculatorForm()),
    );
  }
}
