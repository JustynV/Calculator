import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

class ConnectionController extends GetxController {
  ConnectionController();

  RxBool connectivity = false.obs;
  final Rx<ConnectivityResult> connectionStatus = ConnectivityResult.none.obs;

  bool get isConnected => connectivity.value;

  @override
  void onInit() {
    super.onInit();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      connectionStatus.value = result;
    });
  }

  Future<void> checkConnection() async {
    logInfo("Checking internet Connection...");
    if (connectionStatus.value  == ConnectivityResult.none) {
      connectivity.value = false;
    } else {
      connectivity.value = true;
    }
  }
}
