import 'package:flutter/material.dart';

class NumberButton extends StatelessWidget {

  String number;
  Function setInput;
  NumberButton(this.number, this.setInput);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        setInput(this.number);
      },
      child: Text(
        number,
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}