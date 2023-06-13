// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';

AppBar buildappbarR() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.transparent,
    centerTitle: false,
    leading: IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.arrow_back_ios_new,
        color: textcolor2,
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
  );
}
