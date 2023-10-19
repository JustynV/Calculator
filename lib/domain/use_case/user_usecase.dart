import 'package:get/get.dart';
import '../models/user.dart';
import '../repositories/repository.dart';

class UserUseCase {
  final Repository _repository = Get.find();

  UserUseCase();

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);

}
