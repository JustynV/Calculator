import 'package:f_web_authentication/data/datasources/remote/historial_datasource.dart';
import 'package:f_web_authentication/data/datasources/remote/user_datasource.dart';
import 'package:f_web_authentication/domain/models/historial.dart';
import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/domain/models/user.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:loggy/loggy.dart';
import 'dart:html' as html;

class ConnectionController extends GetxController {
  ConnectionController();

  RxBool connectivity = true.obs;
  //final Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;
  bool get isConnected => connectivity.value;

  void isOnline() {
    logInfo("Checking internet Connection web...");
    connectivity.value = html.window.navigator.onLine!;
    html.window.onOnline.listen((_) {
      connectivity.value = true;
      updateDatasources();
    });
    html.window.onOffline.listen((_) {
      connectivity.value = false;
    });
  }

  Future<void> updateDatasources() async {
    logInfo('updating...');
    HistorialDataSource historialDataSource = Get.find();
    UserDataSource userDataSource = Get.find();
    logInfo("Data sources set");

    var users = Hive.box('users').values;
    var historials = Hive.box('historials').values;

    var histKeys = Hive.box('historials').keys;
    var userKeys = Hive.box('users').keys;

    for (var user in users) {
      logInfo(user);
      User u = User(
          id: user.id,
          firstName: user.gFname,
          lastName: user.gLname,
          email: user.gemail,
          school: user.gschool,
          grade: user.ggrade,
          bdate: user.gbdate,
          password: user.gpassword,
          difficulty: user.gdifficulty);
      logInfo(await userDataSource.verifyEmail(u.gemail));
      if (await userDataSource.verifyEmail(u.gemail)) {
        await userDataSource.updateUser(u);
      } else {
        await userDataSource.signUp(u);
      }
    }

    Hive.box('users').deleteAll(userKeys);

    addAllUsers();

    logInfo("Users updated");

    for (var historial in historials) {
      Historial h = Historial(
          q1: historial.q1,
          q2: historial.q2,
          q3: historial.q3,
          q4: historial.q4,
          q5: historial.q5,
          q6: historial.q6,
          time: historial.time,
          difficulty: historial.difficulty,
          userID: historial.userID);

      await historialDataSource.addHistorial(h);
    }
    Hive.box('historials').deleteAll(histKeys);

    logInfo("Historials updated");
  }

  Future<void> addAllUsers() async {
    UserDataSource userDataSource = Get.find();
    final users = await userDataSource.getAll();
    logInfo("Adding all users in local");
    for (var user in users) {
      Hive.box('users').add(LocalUser.fromJson(user));
    }
  }

  // @override
  // void onInit() {
  //   super.onInit();
  //   Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
  //     connectionStatus.value = result;
  //   });
  // }

  // Future<void> checkConnection() async {
  //   logInfo("Checking internet Connection...");
  //   if (connectionStatus.value == ConnectivityResult.none) {
  //     connectivity.value = false;
  //   } else if (connectionStatus.value == ConnectivityResult.wifi) {
  //     connectivity.value = true;
  //   }
  // }
}
