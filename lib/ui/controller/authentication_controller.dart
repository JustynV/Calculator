import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/domain/use_case/authentication_usecase.dart';
import 'package:get/get.dart';

import 'package:loggy/loggy.dart';

import '../../domain/models/user.dart';

class AuthenticationController extends GetxController {
  final logged = false.obs;
  final exist = false.obs;
  bool get isLogged => logged.value;

  Future<bool> login(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller logging in');
    logged.value = await authentication.login(email, password);
    return logged.value;
  }

  Future<bool> signUp(User user) async {
    final AuthenticationUseCase authentication = Get.find();

    logInfo('Controller Sign Up');
    await authentication.signUp(user);
    return true;
  }

  Future<bool> verifyEmail(String? value) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Verifying email');
    exist.value = await authentication.verifyEmail(value);
    return exist.value;
  }

  Future<bool> loginLocal(email, password) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller logging in local');
    logged.value = await authentication.loginLocal(email, password);
    return logged.value;
  }

  Future<bool> signUpLocal(LocalUser user) async {
    final AuthenticationUseCase authentication = Get.find();

    logInfo('Controller Sign Up Local');
    await authentication.signUpLocal(user);
    return true;
  }

  Future<bool> verifyEmailLocal(String? value) async {
    final AuthenticationUseCase authentication = Get.find();
    logInfo('Controller Verifying email Local');
    exist.value = await authentication.verifyEmailLocal(value);
    return exist.value;
  }

  Future<void> logOut() async {
    logged.value = false;
  }}
