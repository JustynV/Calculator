import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberButton extends StatelessWidget {

  final String number;
  NumberButton(this.number, {super.key});
  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        opController.updateInput(number);
      },
      child: Text(
        number,
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}