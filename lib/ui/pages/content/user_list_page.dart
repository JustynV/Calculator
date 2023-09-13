import 'package:f_web_authentication/ui/pages/content/edit_user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../../../domain/models/user.dart';
import '../../controller/authentication_controller.dart';
import '../../controller/user_controller.dart';
import 'new_user_page.dart';

class NumberButton extends StatefulWidget {
  final String number;

  NumberButton(this.number);

  @override
  State<NumberButton> createState() => _NumberButtonState();
}

class _NumberButtonState extends State<NumberButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: ElevatedButton(
      onPressed: () {
        // Handle button press here (you can use this callback to input the number).
        print('Button pressed: ${widget.number}');
      },
      child: Text(
        widget.number,
        style: TextStyle(fontSize: 16.0),
      ),
    ));
  }
}

class ClearButton extends StatefulWidget {
  @override
  State<ClearButton> createState() => _ClearButtonState();
}

class _ClearButtonState extends State<ClearButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: ElevatedButton(
      onPressed: () {
        // Handle button press here (you can use this callback to input the number).
      },
      child: Text(
        "C",
        style: TextStyle(fontSize: 16.0),
      ),
    ));
  }
}

class GoButton extends StatefulWidget {
  @override
  State<GoButton> createState() => _GoButtonState();
}

class _GoButtonState extends State<GoButton> {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
        child: ElevatedButton(
      onPressed: () {
        setState(() {});
      },
      child: Text(
        "Go",
        style: TextStyle(fontSize: 16.0),
      ),
    ));
  }
}

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  UserController userController = Get.find();
  AuthenticationController authenticationController = Get.find();

  _logout() async {
    try {
      await authenticationController.logOut();
    } catch (e) {
      logInfo(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora"), actions: [
        IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              _logout();
            }),
        IconButton(
            icon: const Icon(Icons.access_time),
            onPressed: () {
              userController.simulateProcess();
            }),
      ]),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logInfo("Add user from UI");
          Get.to(() => const NewUserPage());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            child: Text(
          key: const Key("Operation"),
          "2+2",
          style: TextStyle(fontSize: 50.0),
        )),
        Container(
            child: Text(
          key: const Key("UserInput"),
          "0",
          style: TextStyle(fontSize: 50.0),
        )),
        Expanded(child: Container(
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("7"),
                NumberButton("8"),
                NumberButton("9")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("4"),
                NumberButton("5"),
                NumberButton("6")
              ]),
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("1"),
                NumberButton("2"),
                NumberButton("3")
              ]),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [NumberButton("0"), ClearButton(), GoButton()])
            ],
          ),
        )
        )
    );
        
  }
}
