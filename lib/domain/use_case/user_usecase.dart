import 'package:get/get.dart';
import '../models/user.dart';
import '../repositories/repositories.dart';

class UserUseCase {
  final Repositories _repository = Get.find();

  UserUseCase();

  Future<void> updateUser(User user) async =>
      await _repository.updateUser(user);


}
