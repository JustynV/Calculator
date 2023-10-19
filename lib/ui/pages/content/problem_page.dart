
import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/models/user.dart';
import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/sendButton.dart';
import '../Widgets/numberButton.dart';

class ProblemPage extends StatelessWidget {
  ProblemPage({super.key, required this.operation, required this.user});

  final String operation;

  final OperationController opController = Get.find();
  final AuthenticationController authController = Get.find();
  final User user;


  final time = Stopwatch()..start();

  List operations = [];
  List ans = [];

  String getData() {
    if (opController.tries.value > 0) {
      return operations[opController.tries.value - 1][0] +
          "  " +
          operation +
          "  " +
          operations[opController.tries.value - 1][1];
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
                    opController.addHistorial(
                      Historial(
                      q1: ans[0], 
                      q2: ans[1], 
                      q3: ans[2], 
                      q4: ans[3], 
                      q5: ans[4],
                      q6: ans[5], 
                      time: time.elapsed.toString(), 
                      difficulty: opController.getDifficulty.toString(),
                      userID: user.id.toString()));
                    Navigator.pop(context,opController.correct.value);
                  }
                  return Container();
                },
              ),
        Obx(() => Text("${getData()} = ${opController.input.value}",
            style: TextStyle(fontSize: 64.0))),
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
                        ClearButton(),
                        Obx(() => SendButton(
                              a: operations[opController.tries.value - 1][0],
                              b: operations[opController.tries.value - 1][1],
                              operation: operation,
                            )),
                      ],
                    ),
                    Obx(() => Text(
                        "Ejercicios restantes: ${opController.tries.value}",
                        style: const TextStyle(fontSize: 20.0))),
                    Obx(() => Text(
                        "Respuestas correctas : ${opController.correct.value.toString()}",
                        style: const TextStyle(fontSize: 20.0))),
                    Obx(() => Text(
                        "Tiempo transcurrido : ${time.elapsed.toString()}",
                        style: const TextStyle(fontSize: 20.0)))
                  ])),
        ),
      ])),
    );
  }
}
