import 'package:f_web_authentication/ui/controller/authentication_controller.dart';
import 'package:f_web_authentication/ui/controller/connection_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/authentication/login_page.dart';
import 'pages/content/user_page.dart';

class Central extends StatelessWidget {
  const Central({super.key});

  @override
  Widget build(BuildContext context) {
    AuthenticationController authenticationController = Get.find();
    ConnectionController connectionController = Get.find();
    connectionController.checkConnection();
    return Obx(() =>
        authenticationController.isLogged ? UserPage() : const LoginPage());
  }
}
