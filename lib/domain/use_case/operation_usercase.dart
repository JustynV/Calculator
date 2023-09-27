import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class OperationUsercase {
  int setDifficulty(int difficulty, int correct) {
    if (correct >= 5) {
      difficulty += 1;
    }
    return difficulty;
  }
}
