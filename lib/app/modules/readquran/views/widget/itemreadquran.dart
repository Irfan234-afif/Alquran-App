import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../utils/default.dart';

class ItemReadQuran extends StatelessWidget {
  const ItemReadQuran({
    Key? key,
    required this.ayat,
    required this.arab,
    required this.arti,
  }) : super(key: key);

  final String ayat, arab, arti;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.black12,
        highlightColor: Colors.black26,
        onLongPress: () {
          Get.bottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            Container(
              height: size.height * 0.4,
              width: size.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: const Column(),
            ),
          );
        },
        onTap: () {},
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 18),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Chip(
                backgroundColor: primarycolor,
                label: Text(
                  ayat,
                  style: GoogleFonts.poppins(
                    color: const Color(0xFF484848),
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
                padding: const EdgeInsets.all(10),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        arab,
                        textDirection: TextDirection.rtl,
                        style: GoogleFonts.lateef(
                          color: textcolor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 33,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        arti,
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF484848),
                          fontWeight: FontWeight.w400,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
