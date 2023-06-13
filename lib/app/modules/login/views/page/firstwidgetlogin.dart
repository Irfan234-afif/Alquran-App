import 'package:alquran/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';

class FirstWidgetLogin extends StatelessWidget {
  const FirstWidgetLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        Text(
          "Al-Quran App",
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: textcolor2,
                fontWeight:
                    FontWeight.lerp(FontWeight.w900, FontWeight.w900, 10),
              ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Learn Quran every day and\nrecite once everyday",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: textcolor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Obx(
          () => AnimatedScale(
            duration: const Duration(seconds: 1),
            scale: controller.indexlogin.value == 0 ? 1 : 1.3,
            child: AnimatedSlide(
              duration: const Duration(seconds: 1),
              offset: controller.indexlogin.value == 1
                  ? const Offset(0, 0.3)
                  : const Offset(0, 0),
              child: SizedBox(
                height: size.height * 0.585,
                width: size.width,
                child: Stack(
                  children: [
                    Container(
                      height: size.height * 0.547,
                      width: size.width,
                      decoration: BoxDecoration(
                        color: textcolor2,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF300759).withOpacity(0.25),
                            blurRadius: 40,
                            offset: const Offset(5, 0),
                          ),
                        ],
                        image: const DecorationImage(
                          alignment: Alignment.bottomCenter,
                          image: AssetImage(
                              "assets/images/splashscreen-mosque.png"),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.indexlogin.value = 1;
                          controller.indexlogin.refresh();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: textcolor,
                          padding: const EdgeInsets.symmetric(
                            vertical: 17,
                            horizontal: 38,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        child: Text(
                          "Get Started",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFDAD0E1),
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
