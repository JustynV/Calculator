import 'dart:convert';
import 'package:loggy/loggy.dart';
import '../../../domain/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  final String apiKey = 'RcCOKf';

  Future<bool> signUp(User user) async {
    logInfo("Web service, Adding user");

    final response = await http.post(
      Uri.parse("https://retoolapi.dev/$apiKey/data"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> updateUser(User user) async {
    final response = await http.put(
      Uri.parse("https://retoolapi.dev/$apiKey/data/${user.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(user.toJson()),
    );
    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> login(String email, String password) async {
    final response = await http.put(
      Uri.parse("https://retoolapi.dev/$apiKey/data/email=$email/passsword=$password"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> verifyEmail(String email) async {
    final response = await http.put(
      Uri.parse("https://retoolapi.dev/$apiKey/data/email=$email"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.body.isNotEmpty){
      return Future.value(false);
    }

    if (response.statusCode == 201) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> logOut() async {
    return Future.value(true);
  }

  Future getUser(String theEmail, String thePassword) async{

    final response = await http.put(
      Uri.parse("https://retoolapi.dev/$apiKey/data/email=$theEmail/password=$thePassword"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if(response.body.isNotEmpty){
      logInfo(response.body);
      final data = json.decode(response.body);
      return Future.value(User.fromJson(data[0]));
    }

    if (response.statusCode == 201) {
      logInfo(response.body);
    } else {
      logError("Got error code ${response.statusCode}");
    }
    return null;
  }
}
