import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../controller/authentication_controller.dart';
import '../../controller/user_controller.dart';
import '../../controller/operation_controller.dart';

import '../Widgets/clearButton.dart';
import '../Widgets/goButton.dart';
import '../Widgets/numberButton.dart';

class UserListPage extends StatefulWidget {

  const UserListPage({super.key, required this.difficulty});
  final String difficulty;
  
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

    var rng = Random();
    String input = "0";
    List<String> operation = ["2","+","2"];

    setInput(String number){
      setState(() {
        if (input == "0"){
          input = number;
        }else{        
          input = input + number;
      }
            });
    }
    resetInput(){
      setState(() {
        input = "0";
      });
    }

    sendInput(){
      setState(() {
        if(int.parse(operation[0])+int.parse(operation[2])==int.parse(input)){
          print("Correctomundo");
          resetInput();
        }else{
          print("WRONG");
          resetInput();
        }
        operation[0] = (rng.nextInt(pow(num.parse("10"), num.parse(widget.difficulty)).toInt())+1).toString();
        operation[2] = (rng.nextInt(pow(num.parse("10"), num.parse(widget.difficulty)).toInt())+1).toString();
      });
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
      ]),
      body: Center(child:
       Column(children: [
      Expanded(child: Text(operation[0]+operation[1]+operation[2], style: TextStyle(fontSize: 64.0))),

      Expanded(child: Text(input, style: TextStyle(fontSize: 64.0))),

      Expanded(
          flex: 3,
          child: Container(
          width: 400,
          height: 200,  
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: [
                NumberButton("7", setInput),
                NumberButton("8", setInput),
                NumberButton("9", setInput),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("4", setInput),
                NumberButton("5", setInput),
                NumberButton("6", setInput),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("1", setInput),
                NumberButton("2", setInput),
                NumberButton("3", setInput),
              ],
            ),            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                NumberButton("0", setInput),
                ClearButton(resetInput),
                GoButton(sendInput),
              ],
            )
          ])
          )
          )
    ])
      ),
    );
  }
}
