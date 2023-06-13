import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';

class DrawerHome extends StatelessWidget {
  const DrawerHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        // horizontal: 10,
      ),
      margin: const EdgeInsets.only(
        left: 20,
      ),
      height: size.height * 0.5,
      width: size.width * 0.6,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            offset: const Offset(0, 0),
            spreadRadius: 10,
            blurRadius: 30,
          ),
        ],
      ),
      child: Column(
        children: [
          ListTile(
            leading: Container(
              padding: const EdgeInsets.all(10),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: textcolor2,
                borderRadius: BorderRadius.circular(50 / 2),
              ),
              child: Image.asset('assets/icons/sabit-icon.png'),
            ),
            title: Text(
              "Irfan Afifi",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
          const Spacer(
            flex: 3,
          ),
          ListTile(
            leading: const Icon(
              Icons.explore_outlined,
              color: textcolor2,
              size: 37,
            ),
            title: Text(
              "Explorer",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.notifications_rounded,
              color: textcolor2,
              size: 37,
            ),
            title: Text(
              "Notification",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.settings_outlined,
              color: textcolor2,
              size: 37,
            ),
            title: Text(
              "Settings",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: textcolor2,
              size: 37,
            ),
            title: Text(
              "Log out",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          ListTile(
            leading: const Icon(
              Icons.transit_enterexit_outlined,
              color: textcolor2,
              size: 37,
            ),
            title: Text(
              "Exit",
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w400,
                fontSize: 16,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
