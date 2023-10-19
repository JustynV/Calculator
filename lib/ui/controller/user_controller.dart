import 'package:f_web_authentication/domain/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController();

  Rx<User> user = null.obs as Rx<User>;

  setUser(user){
    user.value = user;
  }

  User getUser() {
    return user.value;
  }

  String getName(){
    return user.value.firstName;
  }
}
