// ignore_for_file: file_names

import 'package:flutter/material.dart'
    show
        BuildContext,
        Column,
        Container,
        CrossAxisAlignment,
        EdgeInsets,
        FontWeight,
        Icon,
        Icons,
        InkWell,
        Key,
        MainAxisAlignment,
        MediaQuery,
        Opacity,
        Positioned,
        Row,
        SizedBox,
        SliverPersistentHeaderDelegate,
        Stack,
        Text,
        Widget;
import 'package:google_fonts/google_fonts.dart' show GoogleFonts;

import '../../../../utils/default.dart' show textcolor2, backgrounddefault;

const _maxheaderExtent = 200.0;
const _minheaderExtent = 110.0;

const _maxsurahposition = 250;
const _maxsurahheight = 60;

class HeaderR extends SliverPersistentHeaderDelegate {
  const HeaderR({
    Key? key,
    required this.leadingtap,
    required this.surah,
    required this.ayat,
    required this.arti,
  });

  final Function() leadingtap;
  final String surah, ayat, arti;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final paddingtop = MediaQuery.of(context).padding.top;
    final size = MediaQuery.of(context).size;
    final percent = shrinkOffset / _maxheaderExtent;
    var surahposition =
        ((_maxsurahposition * percent) * 2).clamp(0, _maxsurahposition);
    var heightsurah =
        _maxsurahheight - ((percent * _maxsurahheight) * 2).clamp(0, 50);
    return Container(
      padding: EdgeInsets.only(
        top: paddingtop,
        left: 20,
        right: 20,
        bottom: 15,
      ),
      color: backgrounddefault,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Row(
              children: [
                InkWell(
                  radius: 80,
                  onTap: leadingtap,
                  child: const Icon(
                    Icons.arrow_back_ios_new,
                    color: textcolor2,
                    size: 25,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Quran",
                  style: GoogleFonts.poppins(
                    color: textcolor2,
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: heightsurah.toDouble(),
            left: surahposition.toDouble(),
            child: Text(
              surah,
              style: GoogleFonts.poppins(
                color: textcolor2,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            child: Opacity(
              opacity: 1 - (percent),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ayat,
                        style: GoogleFonts.poppins(
                          color: textcolor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        arti,
                        style: GoogleFonts.poppins(
                          color: textcolor2,
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            top: 70,
            child: SizedBox(
              width: size.width * 0.4,
              // height: size.height * 0.08,
              // color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.share_outlined,
                      color: textcolor2,
                      size: 32,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.play_arrow_rounded,
                      color: textcolor2,
                      size: 35,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.collections_bookmark_outlined,
                      color: textcolor2,
                      size: 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Column(
          //   children: [
          //     Row(
          //       children: [
          //         IconButton(
          //           onPressed: () {},
          //           icon: Icon(
          //             Icons.arrow_back_ios_new,
          //             color: textcolor2,
          //             size: 30,
          //           ),
          //         ),
          //         Text(
          //           "Quran",
          //           style: GoogleFonts.poppins(
          //             color: textcolor2,
          //             fontWeight: FontWeight.w700,
          //             fontSize: 27,
          //           ),
          //         ),
          //       ],
          //     ),
          //     Row(
          //       children: [
          //         Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             Text(
          //               "Al-Fatihah",
          //               style: GoogleFonts.poppins(
          //                 color: textcolor2,
          //                 fontWeight: FontWeight.w700,
          //                 fontSize: 20,
          //               ),
          //             ),
          //             Text(
          //               "7 ayat",
          //               style: GoogleFonts.poppins(
          //                 color: textcolor2,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 16,
          //               ),
          //             ),
          //             Text(
          //               "( Pembukaan )",
          //               style: GoogleFonts.poppins(
          //                 color: textcolor2,
          //                 fontWeight: FontWeight.w400,
          //                 fontSize: 16,
          //               ),
          //             ),
          //           ],
          //         )
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => _maxheaderExtent;

  @override
  double get minExtent => _minheaderExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
