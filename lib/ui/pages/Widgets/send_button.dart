import 'package:f_web_authentication/ui/pages/content/historial_page.dart';

import '../../controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendButton extends StatelessWidget {

  SendButton({super.key, required this.a, required this.b, required this.operation, });
  final OperationController opController = Get.find();

  final String a;
  final String b;
  final String operation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 80,
      height: 80,
        child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
      onPressed: () {
        opController.updateCorrect(int.parse(a), int.parse(b), operation);
        if(opController.tries.value == 0){
          opController.watch.stop();
          opController.setTime(opController.getTime);
          Get.off(HistorialPage());
        }
      },
      child: const Text(
        "GO",
        style: TextStyle(fontSize: 32.0),
      ),
    ));
  }
}