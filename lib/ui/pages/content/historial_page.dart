import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/content/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistorialPage extends StatelessWidget {
  HistorialPage({super.key});

  final OperationController opController = Get.find();

  @override
  Widget build(BuildContext context) {
    List lista = opController.getCorrectLista;
    int time = opController.getTime;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ejercicios"),
        ),
        body: Center(
            child: Column(children: [
          Text("Pregunta 1: ${lista[0]}"),
          Text("Pregunta 2: ${lista[1]}"),
          Text("Pregunta 3: ${lista[2]}"),
          Text("Pregunta 4: ${lista[3]}"),
          Text("Pregunta 5: ${lista[4]}"),
          Text("Pregunta 6: ${lista[5]}"),
          Text("Tiempo: $time" ),
          ElevatedButton(onPressed: () {
            Get.to(UserPage());
          }
           , child: Text(
            "Finalizar",
            style: const TextStyle(fontSize: 32.0)))
        ])));
  }
}
