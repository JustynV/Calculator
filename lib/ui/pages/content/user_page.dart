import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/pages/Widgets/goButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/models/user.dart';

class UserPage extends StatelessWidget {
  @override
  UserPage({super.key, required this.user});

  final OperationController operationController = Get.find();
  final AuthenticationController authenticationController = Get.find();
  final User user;
  
  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Calculadora"), actions: [
          IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                _logout();
              }),
        ]),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
              Text(
                  key: Key("welcomeMessage"),
                  "Bienvenido",
                  style: TextStyle(fontSize: 32.0)),         
              Obx(() => Text(
                  "Nivel de dificultad actual: ${operationController.getDifficulty()}",
                  style: const TextStyle(fontSize: 20.0, color: Colors.blueGrey))),
              GoButton("Suma", "+"),
              GoButton("Resta", "-"),
              GoButton("Multiplicación", "*"),
              GoButton("División", "/"),
            ])));
  }
}
