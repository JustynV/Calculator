import 'dart:convert';
import 'package:loggy/loggy.dart';
import '../../../domain/models/historial.dart';
import 'package:http/http.dart' as http;

class HistorialDataSource {
  final String apiKey = '929Vpx';

  Future<bool> addHistorial(Historial historial) async {
     logInfo("Web service, Adding historial");

    final response = await http.post(
      Uri.parse("https://retoolapi.dev/$apiKey/data"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(historial.toJson()),
    );

    if (response.statusCode == 201) {
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
    }
  }
