import 'package:alquran/app/modules/login/controllers/login_controller.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:alquran/app/utils/default.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondWidgetLogin extends StatelessWidget {
  const SecondWidgetLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<LoginController>();
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Opacity(
            opacity: 0.2,
            child: SizedBox(
              width: size.width,
              child: Image.asset(
                'assets/images/splashscreen-mosque.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Text(
              "Al-Quran App",
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: textcolor2,
                    fontWeight:
                        FontWeight.lerp(FontWeight.w900, FontWeight.w900, 10),
                  ),
            ),
            const Spacer(
              flex: 1,
            ),
            Text(
              "Assalamu Alaikum !!!",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: textcolor,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  color: textcolor,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            TextFormField(
              controller: controller.emaillogin,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                hintText: "Email",
                filled: true,
                fillColor: containercolor,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            ),
            Obx(
              () => TextFormField(
                controller: controller.passwordlogin,
                obscureText: controller.obscureText.value,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 20,
                  ),
                  hintText: "Password",
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.obscureText.value =
                          !controller.obscureText.value;
                    },
                    icon: Icon(
                      controller.obscureText.value
                          ? Icons.remove_red_eye_outlined
                          : Icons.remove_red_eye,
                      color: textcolor2,
                    ),
                  ),
                  filled: true,
                  fillColor: containercolor,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 3,
            ),
            ElevatedButton(
              onPressed: () {
                Get.offAllNamed(Routes.HOME);
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 30,
                ),
                backgroundColor: containercolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Sign In",
                style: GoogleFonts.poppins(
                  color: textcolor2,
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                ),
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              "Or",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
            const Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/google-icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/facebook-icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    'assets/icons/apple-icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            const Spacer(
              flex: 2,
            ),
            RichText(
              text: TextSpan(
                text: "Dont't have account? ",
                style: GoogleFonts.poppins(
                  color: textcolor2,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()..onTap = () {},
                    text: "Register here",
                    style: GoogleFonts.poppins(
                      color: textcolor,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        )
      ],
    );
  }
}
