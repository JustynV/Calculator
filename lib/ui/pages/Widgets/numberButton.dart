import 'package:f_web_authentication/ui/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberButton extends StatelessWidget {

  String number;
  NumberButton(this.number);
  InputController inputController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        inputController.updateInput(this.number);
      },
      child: Text(
        number,
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}