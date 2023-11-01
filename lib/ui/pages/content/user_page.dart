import 'dart:js_util';

import 'package:f_web_authentication/main.dart';
import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:f_web_authentication/ui/pages/Widgets/go_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserPage extends StatelessWidget {
  @override
  UserPage({super.key});

  final OperationController operationController = Get.find();
  final AuthenticationController authenticationController = Get.find();
  final UserController userController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
  operationController.setDiff(userController.gdificulty);
    return Scaffold(
        appBar:
          AppBar(leading: null, 
          title: const Text("Calculadora"), actions: [
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
              Obx(() => Text(
                  key: const Key("welcomeMessage"),
                  "Bienvenido ${userController.gFname}",
                  style: const TextStyle(fontSize: 32.0))),
              Obx(() => Text(
                  "Nivel de dificultad actual: ${userController.gdificulty}",
                  style:
                      const TextStyle(fontSize: 20.0, color: Colors.blueGrey))),
              //child: Row(
              //),const SizedBox(height: 50),
                    
              
            
              GoButton("Suma",iconMap["add"], "+"),
              GoButton("Resta",iconMap["subtraction"],"-"),
              GoButton("Multiplicación",iconMap["multiplication"], "*"),
              GoButton("División",iconMap["division"], "/"),
            ]
            
            ),
            ),
            );
  }
}
