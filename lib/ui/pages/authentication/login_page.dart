import 'package:f_web_authentication/ui/controller/connection_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../controller/authentication_controller.dart';
import 'signup.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController(text: 'a@a.com');
  final controllerPassword = TextEditingController(text: '123456');
  AuthenticationController authenticationController = Get.find();
  ConnectionController connectionController = Get.find();
  UserController userController = Get.find();

  _login(theEmail, thePassword) async {
    logInfo('_login $theEmail $thePassword');
    try {
      bool a;
      if (connectionController.isConnected) {
        a = await authenticationController.login(theEmail, thePassword);
      } else {
        a = await authenticationController.loginLocal(theEmail, thePassword);
      }
      if (a) {
        Get.snackbar(
          "Login",
          "Login Exitoso",
          icon: const Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Login",
          "Usuario no encontrado, verifique correo y/o contraseña",
          icon: const Icon(Icons.person, color: Colors.red),
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formKey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Login with email",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmail,
                      key: Key("EmailInput"),
                      decoration:
                          const InputDecoration(labelText: "Email address"),
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter email";
                        } else if (!value.contains('@')) {
                          return "Enter valid email address";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: controllerPassword,
                      decoration: const InputDecoration(labelText: "Password"),
                      keyboardType: TextInputType.number,key: Key("PasswordInput"),
                      obscureText: true,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Enter password";
                        } else if (value.length < 6) {
                          return "Password should have at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          final form = _formKey.currentState;
                          form!.save();
                          if (_formKey.currentState!.validate()) {
                            await _login(
                                controllerEmail.text, controllerPassword.text);
                          }
                        },
                        child: const Text("Submit")),
                  ]),
            ),
            TextButton(
                onPressed: () {
                  if (connectionController.isConnected) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  } else {
                    Get.snackbar(
                      "Sign Up",
                      "Necesita acceso a internet para crear usuarios, verifique su conexión",
                      icon: const Icon(Icons.person, color: Colors.red),
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  }
                },
                child: const Text("Create account")),
            Obx(() => Text(
                connectionController.isConnected
                    ? "Conectado"
                    : "Desconectado",
                style: connectionController.isConnected
                    ? TextStyle(color: Colors.green, fontSize: 40.0)
                    : TextStyle(color: Colors.red, fontSize: 40.0))),
          ],
        ),
      ),
    );
  }
}
