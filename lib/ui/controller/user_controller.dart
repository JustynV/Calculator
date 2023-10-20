import 'package:f_web_authentication/domain/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController();

  late Rx<User> user;

  setUser(User u){
    user.value = u;
  }

  User getUser() {
    return user.value;
  }

  String getName(){
    return user.value.firstName;
  }
}
