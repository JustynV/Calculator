import 'package:f_web_authentication/data/datasources/remote/historial_datasource.dart';
import 'package:f_web_authentication/data/local_historial_datasource.dart';
import 'package:f_web_authentication/data/local_user_datasource.dart';
import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/models/local_historial.dart';
import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:loggy/loggy.dart';

import '../../data/datasources/remote/user_datasource.dart';
import '../models/user.dart';

class Repositories {
  late UserDataSource _userDatasource;
  late HistorialDataSource _historialDatasource;
  late LocalUserDataSource _localUserDataSource;
  late LocalHistorialDataSource _localHistorialDataSource;

  Repositories() {
    _userDatasource = UserDataSource();
    _historialDatasource = HistorialDataSource();
    _localUserDataSource = LocalUserDataSource();
    _localHistorialDataSource = LocalHistorialDataSource();
  }

  Future<bool> login(String email, String password) async {
    logInfo("Repositories Logging In");
    return await _userDatasource.login(email, password);

  }

  Future<bool> signUp(User user) async {
    logInfo("Repositories Sign Up");
    return await _userDatasource.signUp(user);
  }

  Future<bool> updateUser(User user) async =>
      await _userDatasource.updateUser(user);

  Future<bool> addHistorial(Historial historial) async {
    logInfo("Repositories adding historial");
    return await _historialDatasource.addHistorial(historial);
  }

  Future<bool> verifyEmail(String? value) async {
    logInfo("Repositories verifying email");
    return await _userDatasource.verifyEmail(value);
  }

  Future<bool> loginLocal(String email, String password) async {
    logInfo("Repositories Logging In Local");
    return await _localUserDataSource.login(email, password);
  }
  
  Future<bool> updateUserLocal(LocalUser user) async {
    return await _localUserDataSource.updateUser(user);
  }

  Future<bool> addHistorialLocal(LocalHistorial historial) async {
    logInfo("Repositories adding historial local");
    return await _localHistorialDataSource.addHistorial(historial);
  }

  Future<bool> logOut() async => await _userDatasource.logOut();
}
