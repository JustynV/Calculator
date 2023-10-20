import '../../controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberButton extends StatelessWidget {

  final String number;
  NumberButton(this.number, {super.key});
  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
        child: ElevatedButton(
      onPressed: () {
        opController.updateInput(number);
      },
      child: Text(
        number,
        style: const TextStyle(fontSize: 32.0),
      ),
    ));
  }
}