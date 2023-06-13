import 'package:alquran/app/utils/default.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../widget/richtextpray.dart';

class PrayHome extends StatelessWidget {
  const PrayHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
        top: 10,
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 0.45,
            width: size.width,
            decoration: const BoxDecoration(
              color: containercolor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: TableCalendar(
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                titleTextStyle: GoogleFonts.poppins(
                  color: const Color(0xFF484848),
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
                leftChevronIcon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Color(0xFF484848),
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF484848),
                ),
                formatButtonVisible: false,
                titleCentered: true,
                headerPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
              ),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2010),
              lastDay: DateTime.utc(2030),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: size.height * 0.12,
            width: size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            decoration: const BoxDecoration(
              color: containercolor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichTextPray(
                      label: "Fajr",
                      time: "05:55",
                    ),
                    RichTextPray(
                      label: "Zuhr",
                      time: "05:55",
                    ),
                    RichTextPray(
                      label: "Ashr",
                      time: "05:55",
                    ),
                  ],
                ),
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichTextPray(
                      label: "Maghrib",
                      time: "06:37",
                    ),
                    RichTextPray(
                      label: "Isya",
                      time: "06:37",
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Container(
            height: size.height * 0.09,
            width: size.width,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: const BoxDecoration(
              color: containercolor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Direction",
                  style: GoogleFonts.poppins(
                    color: textcolor2,
                    fontWeight: FontWeight.w700,
                    fontSize: 17,
                  ),
                ),
                Transform.rotate(
                  angle: 0.7,
                  child: const Icon(
                    Icons.navigation,
                    color: textcolor2,
                    size: 40,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
