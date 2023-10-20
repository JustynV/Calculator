import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

class LocalUserDataSource {
  Future<bool> signUp(LocalUser user) async {
    try {
      Hive.box("Users").add(user);
      return Future.value(true);
    } catch (error) {
      logError(error);
      return Future.value(false);
    }
  }

  Future<bool> updateUser(LocalUser user) async {
    try {
      Hive.box("Users").put(user.id, user);
      return Future.value(true);
    } catch (error) {
      logError(error);
      return Future.value(false);
    }
  }

  Future<bool> login(String email, String password) async {
    return Hive.box("Users").get({email, password}) == null
        ? Future.value(false)
        : Future.value(true);
  }

  Future<bool> verifyEmail(String? email) async {
    return Hive.box("Users").get({email}) == null
        ? Future.value(false)
        : Future.value(true);
  }

  Future<bool> logOut() async {
    return Future.value(true);
  }
}
