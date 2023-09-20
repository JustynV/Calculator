import 'dart:math';

import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/UserPage.dart';
import 'package:flutter/material.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/sendButton.dart';
import '../Widgets/numberButton.dart';

class ProblemPage extends StatefulWidget {
  const ProblemPage({super.key, required this.op, required this.difficulty});
  final String difficulty;
  final String op;
  @override
  State<ProblemPage> createState() => _ProblemPageState();
}

class _ProblemPageState extends State<ProblemPage> {
  int correct = 0;

  final time = Stopwatch()..start();
  var rng = Random();
  String input = "0";
  List<String> operation = [];
  int tries = 6;

  void initOP() {
    String a = generateNum();
    String b = generateNum();
    operation = [a, widget.op, b];
  }

  String generateNum() {
    return (rng.nextInt(
                pow(num.parse("10"), num.parse(widget.difficulty)).toInt()) +
            1)
        .toString();
  }

  bool checkAnswer(List<String> op, String input) {
    int a = int.parse(op[0]);
    int b = int.parse(op[2]);
    int intput = int.parse(input);

    switch (op[1]) {
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
      if (checkAnswer(operation, input)) {
        resetInput();
        correct += 1;
      } else {
        resetInput();
      }
      tries = tries - 1;
      operation[0] = generateNum();
      operation[2] = generateNum();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (operation.isEmpty) {
      initOP();
    }

    if (tries == 0) {
      Navigator.pop(context, correct);
      time.stop();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicios"),
      ),
      body: Center(
          child: Column(children: [
        Expanded(
            child: Text(operation[0] + operation[1] + operation[2],
                style: TextStyle(fontSize: 64.0))),
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
                    Row(children: [
                      Text("Ejercicios restantes: " + tries.toString(),
                          style: TextStyle(fontSize: 20.0)),
                      Text("Respuestas correctas : " + correct.toString(),
                          style: TextStyle(fontSize: 20.0))
                    ])
                  ])),
        ),
      ])),
    );
  }
}
