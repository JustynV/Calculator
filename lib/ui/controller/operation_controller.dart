import 'dart:math';

import 'package:f_web_authentication/domain/use_case/operation_usercase.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OperationController extends GetxController {
  OperationController();
  RxInt difficulty = 1.obs;
  OperationUsercase opUsercase = Get.find();
  late int correct;
  var rng = Random();

  void setDifficulty(int correct) {
    difficulty.value = opUsercase.setDifficulty(difficulty.value, correct);
  }

  int getDifficulty() {
    return difficulty.value;
  }

  String generateNum() {
    return (rng.nextInt(pow(num.parse("10"), difficulty.value).toInt()) + 1)
        .toString();
  }

  List getEjercicios() {
    List ejercicios = [];
    for (int i = 0; i <= 5; i++) {
      ejercicios.add([generateNum(), generateNum()]);
    }
    return ejercicios;
  }
}
