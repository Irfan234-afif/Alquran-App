import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/default.dart';

class RichTextPray extends StatelessWidget {
  const RichTextPray({
    Key? key,
    required this.label,
    required this.time,
  }) : super(key: key);

  final String label, time;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "$label ",
        style: GoogleFonts.poppins(
          color: textcolor2,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
        children: [
          TextSpan(
            text: "${time}am",
            style: GoogleFonts.poppins(
              color: const Color(0xFF484848),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
