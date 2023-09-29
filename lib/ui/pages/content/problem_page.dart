import 'package:f_web_authentication/ui/controller/input_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/sendButton.dart';
import '../Widgets/numberButton.dart';

class ProblemPage extends StatelessWidget {
  ProblemPage({super.key, required this.operation});

  final String operation;
  OperationController opController = Get.find();
  InputController inputController = Get.find();
  final time = Stopwatch()..start();
  int tries = 6;
  int correct = 0;
  get op => operation;
  List operations = [];
  List answers = [];
  
  String getData() {
    if (tries > 0) {
      return operations[tries - 1][0] +
          "  " +
          operation +
          "  " +
          operations[tries - 1][1];
    }
    return "";
  }

  int checkAnswer(String input) {
    int a = int.parse(operations[tries - 1][0]);
    int b = int.parse(operations[tries - 1][1]);
    int intput = int.parse(input);

    switch (operation) {
      case "+":
        if (a + b == intput) {
          return 1;
        }
        return 0;
      case "-":
        if (a - b == intput) {
          return 1;
        }
        return 0;
      case "*":
        if (a * b == intput) {
          return 1;
        }
        return 0;
      case "/":
        if ((a / b).round() == intput) {
          return 1;
        }
        return 0;
    }
    return 0;
  }

  initOP() {
    operations = opController.getEjercicios();
  }

  Widget build(BuildContext context) {
    if (operations.isEmpty) {
      initOP();
    }

    if (tries == 0) {
      opController.setDifficulty(correct);
      time.stop();
      Navigator.pop(context);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicios"),
      ),
      body: Center(
          child: Column(children: [
        Obx(() => Text("${getData()} = ${inputController.input.value}",
            style: TextStyle(fontSize: 64.0)))
        ,
        Expanded(
          flex: 3,
          child: Container(
              width: 400,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("7"),
                        NumberButton("8"),
                        NumberButton("9"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("4"),
                        NumberButton("5"),
                        NumberButton("6"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("1"),
                        NumberButton("2"),
                        NumberButton("3"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("0"),
                        ClearButton(),
                        SendButton(),
                      ],
                    ),
                    Text("Ejercicios restantes: $tries",
                        style: const TextStyle(fontSize: 20.0)),
                    Text("Respuestas correctas : $correct",
                        style: const TextStyle(fontSize: 20.0))
                  ])),
        ),
      ])),
    );
  }
}
