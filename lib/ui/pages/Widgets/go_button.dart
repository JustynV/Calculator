import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/problem_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoButton extends StatelessWidget {
  @override
  GoButton(this.name, this.operation, {super.key});
  final String name;
  final String operation;
  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 250,
        height: 80,
        child: ElevatedButton(
          onPressed: (){
            Get.to(ProblemPage(operation: operation));
          },
          child: Text(
            name,
            style: const TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
