import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendButton extends StatelessWidget {

  SendButton({super.key, required this.a, required this.b, required this.operation, });
  final OperationController opController = Get.find();

  String a;
  String b;
  String operation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      onPressed: () {
        opController.updateCorrect(int.parse(a), int.parse(b), operation);
      },
      child: Text(
        "GO",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}