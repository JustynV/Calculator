import 'dart:math';

import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/UserPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/sendButton.dart';
import '../Widgets/numberButton.dart';

class ProblemPage extends StatefulWidget {
  ProblemPage({super.key, required this.operation});
  final String operation;
  OperationController opController = Get.find();
  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  int correct = 0;

  final time = Stopwatch()..start();
  String input = "0";

  int tries = 6;
  get operation => widget.operation;
  get opController => widget.opController;

  List operations = [];

  bool checkAnswer(String input) {
    int a = int.parse(operations[tries - 1][0]);
    int b = int.parse(operations[tries - 1][1]);
    int intput = int.parse(input);

    switch (operation) {
      case "+":
        if (a + b == intput) {
          return true;
        }
        return false;
      case "-":
        if (a - b == intput) {
          return true;
        }
        return false;
      case "*":
        if (a * b == intput) {
          return true;
        }
        return false;
      case "/":
        if (a / b == intput) {
          return true;
        }
        return false;
    }
    return false;
  }

  setInput(String number) {
    setState(() {
      if (input == "0") {
        input = number;
      } else {
        input = input + number;
      }
    });
  }

  resetInput() {
    setState(() {
      input = "0";
    });
  }

  sendInput() {
    setState(() {
      if (checkAnswer(input)) {
        resetInput();
        correct += 1;
      } else {
        resetInput();
      }
      tries = tries - 1;
    });
  }

  String getData() {
    if (tries > 0) {
      return operations[tries - 1][0] + operation + operations[tries - 1][1];
    }
    return "";
  }

  initOP() {
    operations = opController.getEjercicios();
  }

  @override
  Widget build(BuildContext context) {
    if (operations.isEmpty) {
      initOP();
    }

    if (tries == 1) {
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
        Expanded(child: Text(getData(), style: TextStyle(fontSize: 64.0))),
        Expanded(child: Text(input, style: TextStyle(fontSize: 64.0))),
        Expanded(
          flex: 3,
          child: Container(
              width: 400,
              height: 200,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("7", setInput),
                        NumberButton("8", setInput),
                        NumberButton("9", setInput),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("4", setInput),
                        NumberButton("5", setInput),
                        NumberButton("6", setInput),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("1", setInput),
                        NumberButton("2", setInput),
                        NumberButton("3", setInput),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        NumberButton("0", setInput),
                        ClearButton(resetInput),
                        sendButton(sendInput),
                      ],
                    ),
                    Text("Ejercicios restantes: " + tries.toString(),
                        style: TextStyle(fontSize: 20.0)),
                    Text("Respuestas correctas : " + correct.toString(),
                        style: TextStyle(fontSize: 20.0))
                  ])),
        ),
      ])),
    );
  }
}
