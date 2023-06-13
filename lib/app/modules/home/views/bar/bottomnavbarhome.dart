import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../utils/default.dart';
import '../../controllers/home_controller.dart';

class BottomNavbarHome extends StatelessWidget {
  const BottomNavbarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: size.height * 0.11,
      width: size.width,
      // color: Colors.amber,
      alignment: Alignment.center,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                if (controller.indexhome.value != 0) {
                  controller.indexhome.value = 0;
                  controller.indexhome.refresh();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.indexhome.value == 0
                    ? textcolor2
                    : containercolor,
                fixedSize: controller.indexhome.value == 0
                    ? const Size(90, 90)
                    : const Size(70, 70),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90 / 2),
                ),
              ),
              child: Image.asset(
                controller.indexhome.value == 0
                    ? 'assets/icons/book-active.png'
                    : 'assets/icons/book-inactive.png',
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.indexhome.value != 1) {
                  controller.indexhome.value = 1;
                  controller.indexhome.refresh();
                } else if (controller.scrollberanda.offset > 0) {
                  controller.scrollberanda.animateTo(
                    0,
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.fastOutSlowIn,
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.indexhome.value == 1
                    ? textcolor2
                    : containercolor,
                fixedSize: controller.indexhome.value == 1
                    ? const Size(90, 90)
                    : const Size(70, 70),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90 / 2),
                ),
              ),
              child: Image.asset(
                controller.indexhome.value == 1
                    ? 'assets/icons/home-active.png'
                    : 'assets/icons/home-inactive.png',
                fit: BoxFit.contain,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                if (controller.indexhome.value != 2) {
                  controller.indexhome.value = 2;
                  controller.indexhome.refresh();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: controller.indexhome.value == 2
                    ? textcolor2
                    : containercolor,
                fixedSize: controller.indexhome.value == 2
                    ? const Size(90, 90)
                    : const Size(70, 70),
                padding: const EdgeInsets.all(20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(90 / 2),
                ),
              ),
              child: Image.asset(
                controller.indexhome.value == 2
                    ? 'assets/icons/mosque-active.png'
                    : 'assets/icons/mosque-inactive.png',
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
