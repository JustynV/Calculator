import 'dart:convert';
import 'package:f_web_authentication/data/datasources/remote/local_user_datasource.dart';
import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import '../../../domain/models/user.dart';
import 'package:http/http.dart' as http;

class UserDataSource {
  final String apiKey = 'q77glU';

  Future<bool> signUp(User user) async {
    LocalUserDataSource localUserDataSource = Get.find();

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
      localUserDataSource.addUser(LocalUser(
          firstName: user.gFname,
          lastName: user.gLname,
          email: user.gemail,
          school: user.gschool,
          grade: user.ggrade,
          bdate: user.gbdate,
          password: user.gpassword,
          difficulty: user.gdifficulty));
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
    if (response.statusCode == 200) {
      //logInfo(response.body);
      return Future.value(true);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<dynamic> getAll() async{
    final response = await http.get(Uri.parse(
        "https://retoolapi.dev/$apiKey/data"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return (data);
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> login(String email, String password) async {
    LocalUserDataSource localUserDataSource = Get.find();

    UserController userController = Get.find();
    final response = await http.get(Uri.parse(
        "https://retoolapi.dev/$apiKey/data?email=$email&password=$password"));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        userController.setUser(User.fromJson(data[0]));
        localUserDataSource.addUser(LocalUser.fromJson(data[0]));
        return Future.value(true);
      } else {
        return Future.value(false);
      }
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> verifyEmail(String? email) async {
    final response = await http.get(
      Uri.parse("https://retoolapi.dev/$apiKey/data?email=$email"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isEmpty) {
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } else {
      logError("Got error code ${response.statusCode}");
      return Future.value(false);
    }
  }

  Future<bool> logOut() async {
    return Future.value(true);
  }
}
