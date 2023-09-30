import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/problem_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GoButton extends StatelessWidget {
  @override
  GoButton(this.name, this.operation);
  final String name;
  final String operation;
  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 80,
        child: ElevatedButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProblemPage(
                        operation: operation,
                      )),
            );
            opController.setDifficulty(int.parse(result.toString()));
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
