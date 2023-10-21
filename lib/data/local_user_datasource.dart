import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

class LocalUserDataSource {

  Future<bool> updateUser(LocalUser user) async {
    logInfo("Datasource updating user local");
    for (var key in Hive.box('users').keys) {
      final value = Hive.box('users').get(key);
      if (value.email == user.email && value.password == user.password) {
        logInfo("User found");
        Hive.box('users').put(key, user);
        return Future.value(true);
      }
    }
    return Future.value(false);
  }

  Future<bool> login(String email, String password) async {
    UserController userController = Get.find();
    logInfo("Local datasource Login");

    for (var user in Hive.box('users').values){
      logInfo(user);
    } 

    for (var key in Hive.box('users').keys) {
      final value = Hive.box('users').get(key);
      if (value.email == email && value.password == password) {
        logInfo(value.gid);
        userController.setLocalUser(value);
        return Future.value(true);
      }
    }
    return Future.value(false);
  }

  Future<bool> addUser(user) async {
    logInfo("Local datasource adding");
    try {
      Hive.box('users').add(user);
      return Future.value(true);
    } catch (err) {
      return Future.value(false);
    }
  }
}

Future<bool> logOut() async {
  return Future.value(true);
}
