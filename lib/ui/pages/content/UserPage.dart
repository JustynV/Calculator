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
  OperationController operationController = OperationController(correct: 0);

  UserController userController = Get.find();

  AuthenticationController authenticationController = Get.find();

  late String diff;

  String getDifficulty() {
    return operationController.getDifficulty;
  }

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
    diff = getDifficulty();
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
                  "Bienvenido, Dificultad actual: $diff",
                  style: TextStyle(fontSize: 32.0)),
              goButton("Suma", "+", diff, setDifficulty),
              goButton("Resta", "-", diff, setDifficulty),
              goButton("Multiplicación", "*", diff, setDifficulty),
              goButton("División", "/", diff, setDifficulty)
            ])));
  }
}
