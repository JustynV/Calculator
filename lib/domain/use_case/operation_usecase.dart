import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/repositories/repository.dart';
import 'package:get/get.dart';

class OperationUsecase {

  final Repository _repository = Get.find();

  int setDifficulty(int difficulty, int correct) {
    if (correct >= 5) {
      difficulty += 1;
    }
    return difficulty;
  }

  Future<void> addHistorial(Historial historial) async =>
    await _repository.addHistorial(historial);

}
