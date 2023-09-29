import 'package:f_web_authentication/ui/controller/input_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendButton extends StatelessWidget {

  SendButton();
  InputController inputController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      onPressed: () {
        
      },
      child: Text(
        "GO",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}