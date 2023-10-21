import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

class LocalUserDataSource {
  Future<bool> signUp(LocalUser user) async {
    logInfo("Local datasource signUp");
    try {
      Hive.box('users').add(user);
      return Future.value(true);
    } catch (error) {
      logError(error);
      return Future.value(false);
    }
  }

  Future<bool> updateUser(LocalUser user) async {
    logInfo("Datasource updating user local");
    try {
      Hive.box('users').put(user.id, user);
      final allValues = Hive.box('users').values;
      for (var value in allValues) {
        logInfo(value);
      }
      return Future.value(true);
    } catch (error) {
      logError(error);
      return Future.value(false);
    }
  }

  Future<bool> login(String email, String password) async {
    UserController userController = Get.find();
    logInfo("Local datasource Login");
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

  Future<bool> verifyEmail(String? email) async {
    logInfo("Local datasource Login");
    for (var key in Hive.box('users').keys) {
      final value = Hive.box('users').get(key);
      if (value.email == email) {
        return Future.value(false);
      }
    }
    return Future.value(true);
  }

  Future<bool> logOut() async {
    return Future.value(true);
  }
}
