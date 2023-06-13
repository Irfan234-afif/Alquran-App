import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';
import '../../controllers/home_controller.dart';

AppBar buildappbar(BuildContext context) {
  final controller = Get.find<HomeController>();
  final size = MediaQuery.of(context).size;
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: Builder(
      builder: (context1) => IconButton(
        onPressed: () {
          Scaffold.of(context1).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: 30,
          color: menucolor,
        ),
      ),
    ),
    title: Text(
      'Al-Quran',
      style: GoogleFonts.poppins(
        color: textcolor2,
        fontSize: 25,
        fontWeight: FontWeight.w800,
      ),
    ),
    centerTitle: false,
    actions: [
      Obx(
        () => AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.only(
            right: 16,
            top: 6,
            bottom: 6,
          ),
          width:
              controller.onsearch.value ? size.width * 0.8 : size.width * 0.4,
          child: TextField(
            controller: controller.searchhome,
            onTap: () => controller.onsearch.value = true,
            onEditingComplete: () => controller.onsearch.value = false,
            focusNode: controller.focusnodesearch,
            onTapOutside: (event) {
              controller.focusnodesearch.unfocus();
              controller.onsearch.value = false;
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
                left: 18,
              ),
              suffixIcon: IconButton(
                splashRadius: 10,
                onPressed: () {
                  if (controller.onsearch.value == true &&
                      controller.focusnodesearch.hasFocus) {
                    controller.onsearch.value = false;
                    controller.focusnodesearch.unfocus();
                  } else {
                    controller.onsearch.value = true;
                  }
                },
                icon: const Icon(
                  Icons.search,
                  color: textcolor2,
                  size: 30,
                ),
              ),
              filled: true,
              fillColor: containercolor,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
