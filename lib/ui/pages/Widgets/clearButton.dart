import 'package:f_web_authentication/ui/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClearButton extends StatelessWidget {
  InputController inputController = Get.find();

  Widget build(BuildContext context) {
    return Container(
            width: 80,
      height: 80,
        child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
      onPressed: () {
        inputController.resetInput();
      },
      child: Text(
        "C",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}