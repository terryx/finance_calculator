import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompoundCalculatorForm extends StatefulWidget {
  State<StatefulWidget> createState() => _CompoundCalculatorState();
}

class _CompoundCalculatorState extends State<CompoundCalculatorForm> {
  var principalController = TextEditingController();
  var interestController = TextEditingController();
  var compoundController = TextEditingController();
  var _formPadding = 5.0;
  final _formKey = GlobalKey<FormState>();
  String result = "No result";
  var defaultPrincipal = 1000.0;
  var defaultInterest = 16.0;
  var defaultCompound = 20;

  String _calculate() {
    var counter = 0;
    var result = double.tryParse(principalController.text) ?? defaultPrincipal;
    var interestRate =
        double.tryParse(interestController.text) ?? defaultInterest;
    var compoundPeriod =
        int.tryParse(compoundController.text) ?? defaultCompound;
    while (counter < compoundPeriod) {
      result += (result * (interestRate / 100));
      counter += 1;
    }

    NumberFormat nf = new NumberFormat.compact();
    return nf.format(result);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Container(
        padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                  child: TextField(
                    controller: principalController,
                    decoration: InputDecoration(
                        labelText: "Principal",
                        hintText: "Starting Amount e.g $defaultPrincipal",
                        labelStyle: textStyle,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                    keyboardType: TextInputType.number,
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(bottom: _formPadding, top: _formPadding),
                  child: Row(children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: interestController,
                        decoration: InputDecoration(
                            labelText: "Interest Rate %",
                            hintText: "e.g $defaultInterest",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                      child: TextField(
                        controller: compoundController,
                        decoration: InputDecoration(
                            labelText: "Length",
                            hintText: "e.g $defaultCompound",
                            labelStyle: textStyle,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                        keyboardType: TextInputType.number,
                      ),
                    )
                  ]),
                ),
                Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                          color: Theme.of(context).primaryColorDark,
                          textColor: Theme.of(context).primaryColorLight,
                          onPressed: () {
                            setState(() {
                              result = _calculate();
                            });
                          },
                          child: Text(
                            "Submit",
                            textScaleFactor: 1.5,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: _formPadding * 2),
                  child: Padding(
                    padding: EdgeInsets.only(top: _formPadding * 2),
                    child: Text(
                      result,
                      style: textStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
