import 'package:alquran/app/utils/default.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import './page/seconddwidgetlogin.dart';
import './page/firstwidgetlogin.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> widgetlogin = const [
      FirstWidgetLogin(),
      SecondWidgetLogin(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgrounddefault,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.light,
        ),
        leading: Obx(() => controller.indexlogin.value == 1
            ? IconButton(
                alignment: Alignment.center,
                onPressed: () {
                  controller.indexlogin.value = 0;
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                ),
                splashRadius: 20,
              )
            : const SizedBox()),
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.only(
            top: 20,
            bottom: 20,
            left: 20,
            right: 20,
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: widgetlogin[controller.indexlogin.value],
          ),
        ),
      ),
    );
  }
}
