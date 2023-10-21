import 'dart:math';

import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/models/local_historial.dart';
import 'package:f_web_authentication/domain/use_case/operation_usecase.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class OperationController extends GetxController {
  OperationController();

  RxString input = "0".obs;
  RxInt correct = 0.obs;
  RxList correctList = [].obs;
  RxInt difficulty = 1.obs;
  RxInt tries = 6.obs;
  RxInt time = 0.obs;
  OperationUsecase opUsercase = Get.find();
  var watch = Stopwatch();
  var rng = Random();

  int get getTries => tries.value>0?tries.value : 1;
  String get getInput => input.value;
  String get getCorrects => correct.value.toString();
  List get getCorrectLista => correctList;
  int get getTime => watch.elapsed.inSeconds;
  String get getDifficulty => difficulty.value.toString();


  void init() {
    correct.value = 0;
    tries.value = 6;
    input.value = "0";
    correctList.value = [];
    watch = Stopwatch();
    watch.start();
  }

  void setDifficulty(int correct) {
    difficulty.value = opUsercase.setDifficulty(difficulty.value, correct);
  }
  
  void setDiff(String userDiff){
    difficulty.value = int.parse(userDiff);
  }

  void setTime(int t){
    time.value = t;
  }

  String generateNum() {
    return (rng.nextInt(pow(num.parse("10"), difficulty.value).toInt()) + 1)
        .toString();
  }

  List getEjercicios() {
    List ejercicios = [];
    for (int i = 0; i <= 5; i++) {
      String a = generateNum();
      String b = generateNum();
      if (int.parse(b) > int.parse(a)) {
        ejercicios.add([b, a]);
      } else {
        ejercicios.add([a, b]);
      }
    }
    return ejercicios;
  }

  void updateInput(String i) {
    if (input.value == "0") {
      input.value = i;
    } else {
      input.value += i;
    }
  }

  void resetInput() {
    input.value = "0";
  }

  void updateCorrect(int a, int b, String operation) {
    int result = checkAnswer(a, b, operation);
    correct.value += result;
    if (result == 1) {
      correctList.add(true);
    } else {
      correctList.add(false);
    }
    tries.value -= 1;

    resetInput();
  }

  int checkAnswer(int a, int b, String operation) {
    int intput = int.parse(input.value);

    switch (operation) {
      case "+":
        if (a + b == intput) {
          return 1;
        }
        return 0;
      case "-":
        if (a - b == intput) {
          return 1;
        }
        return 0;
      case "*":
        if (a * b == intput) {
          return 1;
        }
        return 0;
      case "/":
        if ((a / b).round() == intput) {
          return 1;
        }
        return 0;
    }
    return 0;
  }

  Future<bool> addHistorial(Historial historial) async {
    final OperationUsecase operation = Get.find();
    logInfo('Controller adding Historial');
    await operation.addHistorial(historial);
    return true;
  }

  Future<bool> addHistorialLocal(LocalHistorial historial) async {
    final OperationUsecase operation = Get.find();
    logInfo('Controller adding Historial Local');
    await operation.addHistorialLocal(historial);
    return true;
  }


}
