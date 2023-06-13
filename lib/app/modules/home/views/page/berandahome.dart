import 'package:alquran/app/data/modele/juzmodel.dart';
import 'package:alquran/app/routes/app_pages.dart';
import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../data/modele/surah-modele.dart';
import '../../../../utils/default.dart';
import '../../controllers/home_controller.dart';
import '../widget/itembottomhome.dart';

class BerandaHome extends StatelessWidget {
  const BerandaHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final size = MediaQuery.of(context).size;
    return ListView(
      controller: controller.scrollberanda,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
      ),
      children: [
        Text(
          "Assalamu Alaikum !!!",
          textAlign: TextAlign.start,
          style: GoogleFonts.poppins(
            color: textcolor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          "Irfan Afifi",
          style: GoogleFonts.poppins(
            color: textcolor2,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          height: size.height * 0.2,
          width: size.width,
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
            top: 20,
            bottom: 20,
          ),
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.menu_book_rounded,
                          color: textcolor2,
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Last Read",
                          style: GoogleFonts.poppins(
                            color: textcolor2,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Text(
                      "Al-Fatihah",
                      style: GoogleFonts.poppins(
                        color: textcolor2,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      "Ayat 1",
                      style: GoogleFonts.poppins(
                        color: textcolor2,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                child: Image.asset('assets/icons/alquran-icon.png'),
              ),
            ],
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.height * 0.07,
          // color: Colors.amber,
          child: Stack(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (controller.listviewindex.value != 0) {
                          controller.listviewindex.value = 0;
                          controller.surahjuz.animateToPage(0,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.fastOutSlowIn);
                        }
                      },
                      behavior: HitTestBehavior.translucent,
                      child: Center(
                        child: Obx(
                          () => Text(
                            "Surah",
                            style: GoogleFonts.poppins(
                              color: controller.listviewindex.value == 0
                                  ? textcolor2
                                  : textcolor,
                              fontWeight: controller.listviewindex.value == 0
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        if (controller.listviewindex.value != 1) {
                          controller.listviewindex.value = 1;
                          controller.surahjuz.animateToPage(1,
                              duration: const Duration(milliseconds: 250),
                              curve: Curves.fastOutSlowIn);
                        }
                      },
                      child: Center(
                        child: Obx(
                          () => Text(
                            "Juz",
                            style: GoogleFonts.poppins(
                              color: controller.listviewindex.value == 1
                                  ? textcolor2
                                  : textcolor,
                              fontWeight: controller.listviewindex.value == 1
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => AnimatedPositioned(
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 400),
                  bottom: 0,
                  left: controller.listviewindex.value == 0
                      ? 0
                      : size.width * 0.46,
                  child: Container(
                    color: textcolor2,
                    height: 2,
                    width: size.width * 0.47,
                  ),
                ),
              ),
            ],
          ),
        ),
        ExpandablePageView(
          controller: controller.surahjuz,
          scrollDirection: Axis.horizontal,
          onPageChanged: (value) {
            controller.listviewindex.value = value;
          },
          children: [
            FutureBuilder<List<Surah>>(
              future: controller.getAllsurah(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var data = snapshot.data!;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      Surah surah = data[index];
                      return Column(
                        children: [
                          ItemHomeBottom(
                            onlongpress: () {},
                            ontap: () {
                              var argument = {
                                'jenis': 'surah',
                                'nomor': surah.nomor,
                              };
                              Get.toNamed(
                                Routes.READQURAN,
                                arguments: argument,
                              );
                            },
                            surah: surah.nama!,
                            ayat: "${surah.ayat} ayat",
                            arti: surah.arti!,
                            arab: surah.asma!,
                          ),
                          Divider(
                            color: textcolor.withOpacity(0.5),
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Padding(
                    padding: EdgeInsets.only(
                      top: 70,
                      bottom: 10,
                    ),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
            FutureBuilder<List<Juz>>(
              future: controller.getAlljuz(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      Juz juz = snapshot.data![index];
                      var startayat =
                          "${juz.start!.name!} Ayat ${juz.start!.verse!.substring(6)}";
                      var endayat =
                          "${juz.end!.name!} Ayat ${juz.end!.verse!.substring(6)}";
                      return Column(
                        children: [
                          ItemHomeBottom(
                            surah: "Juz ${juz.index!}",
                            ayat: startayat,
                            arti: endayat,
                            ontap: () {
                              var argument = {
                                'jenis': 'juz',
                                'nomor': juz.index,
                              };
                              Get.toNamed(Routes.READQURAN,
                                  arguments: argument);
                            },
                            onlongpress: () {},
                          ),
                          Divider(
                            color: textcolor.withOpacity(0.5),
                            thickness: 2,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
        // PageView(
        //   children: [
        //     Expanded(
        //       child: Container(
        //         height: 10,
        //         color: Colors.amber,
        //       ),
        //     ),
        //     Expanded(
        //       child: Container(
        //         height: 10,
        //         color: Colors.amber,
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
