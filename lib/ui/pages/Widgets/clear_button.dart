import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearButton extends StatelessWidget {
  final OperationController opController = Get.find();

  ClearButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 80,
      height: 80,
        child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      onPressed: () {
       opController.resetInput();
      },
      child: const Text(
        "C",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}