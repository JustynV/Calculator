import 'package:f_web_authentication/domain/use_case/operation_usercase.dart';
import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:f_web_authentication/ui/pages/Widgets/goButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserPage extends StatefulWidget {
  @override
  UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  OperationController operationController = Get.find();
  UserController userController = Get.find();
  AuthenticationController authenticationController = Get.find();

  void setDifficulty(int correct) {
    setState(() {
      operationController.setDifficulty(correct);
    });
  }

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
                  key: Key("diffMessage"),
                  "Nivel de dificultad actual: ${operationController.difficulty}",
                  style: TextStyle(fontSize: 20.0, color: Colors.amber))),
              goButton("Suma", setDifficulty, operationController, "+"),
              goButton(
                "Resta",
                setDifficulty,
                operationController,
                "-",
              ),
              goButton(
                  "Multiplicación", setDifficulty, operationController, "*"),
              goButton("División", setDifficulty, operationController, "/")
            ])));
  }
}
