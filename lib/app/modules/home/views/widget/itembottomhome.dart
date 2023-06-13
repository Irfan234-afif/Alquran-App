import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';

// ignore: must_be_immutable
class ItemHomeBottom extends StatelessWidget {
  ItemHomeBottom({
    Key? key,
    required this.surah,
    required this.ayat,
    required this.arti,
    String arab = "",
    required this.ontap,
    required this.onlongpress,
  }) : super(key: key);

  final String surah, ayat, arti;
  final Function() ontap, onlongpress;
  late String arab;

  @override
  Widget build(BuildContext context) {
    arab = "";
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 10,
            bottom: 7,
          ),
          // height: size.height * 0.1,
          width: size.width,
          // color: Colors.amber,
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah,
                        style: GoogleFonts.poppins(
                          color: textcolor2,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          height: 2,
                        ),
                      ),
                      Text(
                        ayat,
                        style: GoogleFonts.poppins(
                          color: textcolor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        arti,
                        style: GoogleFonts.poppins(
                          color: textcolor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 15,
                          height: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  arab,
                  textDirection: TextDirection.rtl,
                  style: GoogleFonts.lateef(
                    color: textcolor2,
                    fontSize: 29,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              splashColor: containercolor.withOpacity(0.3),
              highlightColor: containercolor.withOpacity(0.2),
              // splashFactory: ,
              onTap: ontap,
              onLongPress: onlongpress,
            ),
          ),
        ),
      ],
    );
  }
}
