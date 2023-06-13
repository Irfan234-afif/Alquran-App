import 'package:alquran/app/utils/default.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'bar/bottomnavbarhome.dart';
import 'bar/buildappbar.dart';
import './page/berandahome.dart';
import './page/prayhome.dart';
import 'bar/drawer.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Widget> indexhome = [
      const SizedBox(),
      const BerandaHome(),
      const PrayHome(),
    ];
    return Scaffold(
      backgroundColor: backgrounddefault,
      appBar: buildappbar(context),
      drawer: const DrawerHome(),
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          reverseDuration: const Duration(microseconds: 250),
          child: indexhome[controller.indexhome.value],
        ),
      ),
      bottomNavigationBar: const BottomNavbarHome(),
    );
  }
}
