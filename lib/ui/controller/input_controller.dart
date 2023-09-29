import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class InputController extends GetxController {
  InputController();

  RxString input = "0".obs;
  

  void updateInput(String i) {
    if (input.value == "0") {
      input.value = i;
    } else {
      input.value = input.value + i;
    }
  }
  void resetInput() {
    input.value = "0";
  }

}
