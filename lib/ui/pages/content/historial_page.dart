import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/ui/controller/connection_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorialPage extends StatelessWidget {
  HistorialPage({super.key});

  final OperationController opController = Get.find();
  final UserController userController = Get.find();
  final ConnectionController connectionController = Get.find();

  @override
  Widget build(BuildContext context) {
    List lista = opController.getCorrectLista;
    int time = opController.getTime;
    return Scaffold(
        appBar: AppBar(
          leading: null,
          title: const Text("Resultados"),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              const Text("Resultados", style: TextStyle(fontSize: 40.0)),
              Text("Pregunta 1: ${lista[0]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Pregunta 2: ${lista[1]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Pregunta 3: ${lista[2]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Pregunta 4: ${lista[3]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Pregunta 5: ${lista[4]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Pregunta 6: ${lista[5]}",
                  style: const TextStyle(fontSize: 32.0)),
              Text("Tiempo: $time segundos",
                  style: const TextStyle(fontSize: 32.0)),
              Obx(() => Text("Nombre: ${userController.firstName}")),
              ElevatedButton(
                  onPressed: () {
                    opController.addHistorial(Historial(
                        q1: lista[0].toString(),
                        q2: lista[1].toString(),
                        q3: lista[2].toString(),
                        q4: lista[3].toString(),
                        q5: lista[4].toString(),
                        q6: lista[5].toString(),
                        time: time.toString(),
                        difficulty: opController.getDifficulty,
                        userID: userController.getID));

                    opController
                        .setDifficulty(int.parse(opController.getCorrects));

                    userController
                        .setDifficulty(opController.difficulty.toString());

                    if (connectionController.isConnected) {
                      userController.updateUser();
                    } else {
                      userController.updateUserLocal();
                    }
                    Get.back();
                  },
                  child: const Text("Finalizar",
                      style: TextStyle(fontSize: 32.0))),
            ])));
  }
}
