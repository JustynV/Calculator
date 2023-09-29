import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearButton extends StatelessWidget {
  final OperationController opController = Get.find();

  ClearButton({super.key});

  Widget build(BuildContext context) {
    return Container(
            width: 80,
      height: 80,
        child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      onPressed: () {
       opController.resetInput();
      },
      child: Text(
        "C",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}