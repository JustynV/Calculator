import 'package:f_web_authentication/domain/models/local_historial.dart';
import 'package:f_web_authentication/domain/models/local_user.dart';
import 'package:f_web_authentication/domain/use_case/operation_usecase.dart';
import 'package:f_web_authentication/domain/use_case/user_usecase.dart';
import 'package:f_web_authentication/ui/central.dart';
import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/connection_controller.dart';
import 'package:f_web_authentication/ui/controller/operation_controller.dart';
import 'package:f_web_authentication/ui/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:loggy/loggy.dart';
import 'domain/repositories/repositories.dart';
import 'domain/use_case/authentication_usecase.dart';

void main() {
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(Repositories());
  Get.put(OperationUsecase());
  Get.put(AuthenticationController());
  Get.put(AuthenticationUseCase());
  Get.put(UserUseCase());
  Get.put(UserController());
  Get.put(OperationController());
  Get.put(ConnectionController());

  runApp(const MyApp());
}



Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(LocalUserAdapter());
  boxList.add(await Hive.openBox('Users'));
  Hive.registerAdapter(LocalHistorialAdapter());
  boxList.add(await Hive.openBox("Historials"));
  return boxList;
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(

      title: 'Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Central(),
    );
  }
}
