import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/ProblemPage.dart';
import 'package:flutter/material.dart';

class goButton extends StatelessWidget {
  @override
  goButton(this.name, this.setDifficulty, this.opController, this.operation);
  String name;
  String operation;
  OperationController opController;
  Function setDifficulty;

  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 80,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProblemPage(operation: operation)));
          },
          child: Text(
            name,
            style: TextStyle(fontSize: 32.0),
          ),
        ));
  }
}
