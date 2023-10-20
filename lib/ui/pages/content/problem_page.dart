import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:f_web_authentication/ui/pages/content/historial_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/sendButton.dart';
import '../Widgets/numberButton.dart';

class ProblemPage extends StatelessWidget {
  ProblemPage({super.key, required this.operation});

  final String operation;

  final OperationController opController = Get.find();
  final UserController userController = Get.find();

  Stopwatch time = Stopwatch()..start();

  List operations = [];

  String getData() {
    if (opController.getTries > 0) {
      return operations[opController.getTries - 1][0] +
          "  " +
          operation +
          "  " +
          operations[opController.getTries - 1][1];
    }
    return "";
  }

  initOP() {
    opController.init();
    operations = opController.getEjercicios();
  }

  @override
  Widget build(BuildContext context) {
    initOP();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicios"),
      ),
      body: Center(
          child: Column(children: [
        StreamBuilder<int>(
          stream: opController.tries.stream,
          builder: (context, snapshot) {
            if (snapshot.data == 0) {
              Stopwatch().stop();
              opController.time.value = time.elapsed.inSeconds;
              Get.to(HistorialPage());
            }
            return Container();
          },
        ),
        Obx(() => Text("${getData()} = ${opController.getInput}",
            style: const TextStyle(fontSize: 64.0))),
        Expanded(
          flex: 3,
          child: SizedBox(
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
                        clearButton(),
                        Obx(() => SendButton(
                              a: operations[opController.getTries - 1][0],
                              b: operations[opController.getTries - 1][1],
                              operation: operation,
                            )),
                      ],
                    ),
                    Obx(() => Text(
                        "Ejercicios restantes: ${opController.getTries}",
                        style: const TextStyle(fontSize: 20.0))),
                    Obx(() => Text(
                        "Respuestas correctas : ${opController.getCorrects}",
                        style: const TextStyle(fontSize: 20.0))),
                  ])),
        ),
      ])),
    );
  }
}
