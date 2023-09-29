import 'dart:math';

import 'package:f_web_authentication/domain/use_case/operation_usercase.dart';
import 'package:get/get.dart';

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
      String a = generateNum();
      String b = generateNum();
      if(int.parse(b) > int.parse(a)){
        ejercicios.add([b,a]);
      }else{
        ejercicios.add([a, b]);
      }
    }
    return ejercicios;
  }
}
