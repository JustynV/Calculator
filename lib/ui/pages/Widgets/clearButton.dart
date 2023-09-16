import 'package:flutter/material.dart';

class ClearButton extends StatelessWidget {
  @override

  ClearButton(this.resetInput);
  Function resetInput;

  Widget build(BuildContext context) {
    return Container(
            width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        resetInput();
      },
      child: Text(
        "C",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}