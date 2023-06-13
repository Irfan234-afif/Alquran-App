import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  late TextEditingController emaillogin;
  late TextEditingController passwordlogin;

  var indexlogin = 0.obs;
  var obscureText = true.obs;

  @override
  void onInit() {
    emaillogin = TextEditingController();
    passwordlogin = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emaillogin.dispose();
    passwordlogin.dispose();
    super.onClose();
  }
}
