import 'package:f_web_authentication/domain/use_case/authentication_usecase.dart';
import 'package:get/get.dart';

import 'package:loggy/loggy.dart';

import '../../domain/models/user.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;
  bool get isLogged => logged.value;

  Future<void> Login(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller logging in');
    await authentication.login(email, password);
    logged.value = true;
  }

  Future<bool> signUp(User user) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Sign Up');
    await authentication.signUp(user);
    return true;
  }

  Future<void> logOut() async {
    logged.value = false;
  }

  Future<bool> verifyEmail(String value) async{
    final AuthenticationUseCase authentication = Get.find();
    return await authentication.verifyEmail(value);
  }
}
