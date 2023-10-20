
import 'package:f_web_authentication/data/datasources/remote/historial_datasource.dart';
import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:loggy/loggy.dart';

import '../../data/datasources/remote/user_datasource.dart';
import '../models/user.dart';

class Repository {
  late UserDataSource _userDatasource;
  late HistorialDataSource _historialDatasource;

  Repository() {
    _userDatasource = UserDataSource();
  }

  Future<bool> login(String email, String password) async{
    logInfo("Repository Logging In");
    return await _userDatasource.login(email, password);
  }


  Future<bool> signUp(User user) async {
    logInfo("Repository Sign Up");
    return await _userDatasource.signUp(user);
  }

  Future<bool> updateUser(User user) async =>
    await _userDatasource.updateUser(user);

  Future<bool> logOut() async => await _userDatasource.logOut();

  Future<bool> verifyEmail(String value) async {
      return await _userDatasource.verifyEmail(value);
  }

  Future<bool> addHistorial(Historial historial) async {
      return await _historialDatasource.addHistorial(historial);
  }

  getUser(String theEmail, String thePassword)  async {
      return await _userDatasource.getUser(theEmail, thePassword);
    }

}
