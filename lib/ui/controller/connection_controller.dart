
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';

class ConnectionController extends GetxController {
      ConnectionController();

  RxBool connectivity = false.obs;
  
  bool get isConnected => connectivity.value;

  Future<void> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      connectivity.value = false;
    }else{
      connectivity.value = true;
    }
  }
  
}