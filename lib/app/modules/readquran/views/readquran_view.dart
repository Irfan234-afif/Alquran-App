import 'package:alquran/app/data/modele/detailjuz-modele.dart';
import 'package:alquran/app/modules/readquran/views/widget/HeaderR.dart';
import 'package:alquran/app/utils/default.dart';
import 'package:flutter/material.dart'
    show
        BuildContext,
        Center,
        CircularProgressIndicator,
        ConnectionState,
        CustomScrollView,
        EdgeInsets,
        FutureBuilder,
        Key,
        MediaQuery,
        Padding,
        Scaffold,
        SliverChildBuilderDelegate,
        SliverChildListDelegate,
        SliverList,
        SliverPadding,
        SliverPersistentHeader,
        Widget;

import 'package:get/get.dart';

import '../../../data/modele/detailsurahoffline-model.dart';
import '../controllers/readquran_controller.dart';
import './widget/itemreadquran.dart';

class ReadquranView extends GetView<ReadquranController> {
  const ReadquranView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgrounddefault,
      // appBar: buildappbarR(),
      body:
          // FutureBuilder(
          //   future: controller.getdetailsurahoffline(
          //       context, int.parse(Get.arguments['nomor'])),
          //   builder: (context, snapshot) {
          //     return SizedBox();
          //   },
          // ),
          Get.arguments['jenis'] == 'surah'
              ? FutureBuilder<Detailsurah>(
                  future: controller.getdetailsurahoffline(
                      context, int.parse(Get.arguments['nomor'])),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CustomScrollView(
                        scrollBehavior: controller.scrollBehaviorbody,
                        controller: controller.scrollbody,
                        slivers: [
                          SliverPersistentHeader(
                            delegate: HeaderR(
                              leadingtap: () => Get.back(),
                              surah: snapshot.data!.transliteration!,
                              ayat:
                                  "${snapshot.data!.totalVerses.toString()} ayat",
                              arti: snapshot.data!.translation!,
                            ),
                            pinned: true,
                            floating: true,
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 10,
                            ),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  var verse = snapshot.data!.verses![index];
                                  return ItemReadQuran(
                                    ayat: verse.id.toString(),
                                    arab: verse.text!,
                                    arti: verse.translation!,
                                  );
                                },
                                childCount: snapshot.data!.verses!.length,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return
                          // Center(child: CircularProgressIndicator());
                          CustomScrollView(
                        controller: controller.scrollbody,
                        slivers: [
                          SliverList(
                            delegate: SliverChildListDelegate.fixed(
                              [
                                Padding(
                                  padding:
                                      EdgeInsets.only(top: size.height * 0.3),
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                )
              : FutureBuilder<DetailJuz>(
                  future: controller.getdetailjuz(Get.arguments['nomor']),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CustomScrollView(
                        scrollBehavior: controller.scrollBehaviorbody,
                        controller: controller.scrollbody,
                        slivers: [
                          SliverPersistentHeader(
                            delegate: HeaderR(
                              leadingtap: () => Get.back(),
                              surah: "Juz ${snapshot.data!.juz}",
                              ayat: "${snapshot.data!.juzStartInfo}",
                              arti: snapshot.data!.juzEndInfo!,
                            ),
                            pinned: true,
                            floating: true,
                          ),
                          SliverPadding(
                            padding: EdgeInsets.only(
                              left: 15,
                              right: 15,
                              bottom:
                                  MediaQuery.of(context).padding.bottom + 10,
                            ),
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  var verse = snapshot.data!.verses![index];
                                  return ItemReadQuran(
                                    arab: verse.text!.arab!,
                                    ayat: verse.number!.inSurah.toString(),
                                    arti: verse.translation!.id!,
                                  );
                                },
                                childCount: snapshot.data!.verses!.length,
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
    );
  }
}
