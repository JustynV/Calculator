import 'package:flutter/material.dart';


class sendButton extends StatelessWidget {

  sendButton(this.sendInput);
  Function sendInput;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        sendInput();
      },
      child: Text(
        "GO",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}