import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/repositories/repositories.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class OperationUsecase {
  final Repositories _repository = Get.find();

  int setDifficulty(int difficulty, int correct) {
    if (correct >= 5) {
      difficulty += 1;
    }
    return difficulty;
  }

  Future<void> addHistorial(Historial historial) async {
    logInfo("Usecase adding historial");
    await _repository.addHistorial(historial);
  }
}
