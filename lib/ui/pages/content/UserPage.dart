import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:f_web_authentication/ui/pages/Widgets/goButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class UserPage extends StatelessWidget {

  @override

  UserPage({super.key, required this.difficulty});
  String difficulty;
  
  UserController userController = Get.find();
  AuthenticationController authenticationController = Get.find();

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
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [

        Text(key: Key("welcomeMessage"), "Bienvenido"),
        
        goButton("Suma", "+", difficulty),
        goButton("Resta", "-",difficulty),
        goButton("Multiplicación", "*",difficulty),
        goButton("División", "/", difficulty)


      ])));
  }

}
