import 'dart:ffi';

import 'package:f_web_authentication/domain/models/user.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  UserController();

  Rx<User> user = User(
    firstName: "", 
    lastName: "", 
    email: "", 
    school: "", 
    grade: "", 
    bdate: "", 
    password: "", 
    difficulty: "")
  .obs;

  setUser(User u){
    user.value = u;
  }

  User getUser() {
    return user.value;
  }

  String getDifficulty(){
    return user.value.difficulty;
  }

  String getName(){
    return user.value.name;
  }

  getID() {
    return user.value.id.toString();
  }
}
