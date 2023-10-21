
import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../models/user.dart';
import '../repositories/repositories.dart';

class UserUseCase {
  final Repositories _repository = Get.find();

  UserUseCase();

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);

  Future<void> updateUserLocal(LocalUser user) async {
        logInfo("Usercase updating user local");
        await _repository.updateUserLocal(user);
  }
}
