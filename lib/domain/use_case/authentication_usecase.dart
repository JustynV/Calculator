import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/domain/repositories/repositories.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../models/user.dart';

class AuthenticationUseCase {
  final Repositories _repository = Get.find();


  

  Future<bool> login(String email, String password) async {
    logInfo('UseCase Logging in');
    return await _repository.login(email, password);
  }

  Future<bool> signUp(User user) async {
    logInfo('UseCase Sign Up');
    return await _repository.signUp(user);
  }

  Future<bool> verifyEmail(String? value) async {
    return await _repository.verifyEmail(value);
  }

  Future<bool> loginLocal(String email, String password) async {
    logInfo('UseCase Local Logging in');
    return await _repository.loginLocal(email, password);
  }

  Future<bool> signUpLocal(LocalUser user) async {
    logInfo('UseCase Local Sign Up');
    return await _repository.signUpLocal(user);
  }
  
  Future<bool> verifyEmailLocal(String? value) async {
    return await _repository.verifyEmailLocal(value);
  }

  Future<bool> logOut() async => await _repository.logOut();


}
