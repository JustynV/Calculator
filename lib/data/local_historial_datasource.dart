import 'package:f_web_authentication/domain/models/local_historial.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';

class LocalHistorialDataSource {
  final String apiKey = '929Vpx';

  Future<bool> addHistorial(LocalHistorial historial) async {
    try {
      Hive.box("Historials").add(historial);
      return Future.value(true);
    } catch (error) {
      logError(error);
      return Future.value(false);
    }
  }
}
