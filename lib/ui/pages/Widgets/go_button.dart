import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/problem_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoButton extends StatelessWidget {
  

  @override
  GoButton(this.name,this.icono, this.operation, {super.key});
  final String name;
  final String operation;
  final IconData? icono;
  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 300,
        height: 80,
        child: ElevatedButton(
          child: Row(
            children: [
            const SizedBox(height: 50),
                    Icon(icono ?? Icons.error, // Use Icons.error as default icon
              size: 60),
            Text(
            name,
            style: const TextStyle(fontSize: 32.0),
          ),],
          ),
          onPressed: (){
            Get.to(ProblemPage(operation: operation));
          },
          
        ));
  }
}
