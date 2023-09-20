import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OperationController extends GetxController {
  OperationController({required this.correct});
  int difficulty = 1;
  String get getDifficulty => difficulty.toString();
  int correct;

  void setDifficulty(int correct) {
    if (correct > 5) {
      difficulty += 1;
    }
  }

  void onInit() {
    setDifficulty(correct);
    super.onInit();
  }
}
