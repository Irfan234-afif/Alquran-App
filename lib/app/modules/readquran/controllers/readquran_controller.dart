import 'dart:convert';

import 'package:alquran/app/data/modele/detailjuz-modele.dart';
import 'package:alquran/app/data/modele/detailsurahoffline-model.dart'
    show Detailsurah;
import 'package:flutter/material.dart'
    show BuildContext, DefaultAssetBundle, ScrollBehavior, ScrollController;
import 'package:get/get.dart' show GetxController;
import 'package:http/http.dart' as http;

class ReadquranController extends GetxController {
  late ScrollController scrollbody;
  late ScrollBehavior scrollBehaviorbody;

  // Future<Detailsurah> getdetailsurah(String index) async {
  //   Uri uri = Uri.parse("https://api.quran.gading.dev/surah/$index");
  //   try {
  //     var getdata = await http.get(uri);

  //     Map<String, dynamic> respon =
  //         (jsonDecode(getdata.body) as Map<String, dynamic>)["data"];
  //     var detailsurah = Detailsurah.fromJson(respon);
  //     return detailsurah;
  //   } catch (e) {
  //     print(e);
  //     return Detailsurah.fromJson({});
  //   }
  // }

  Future<Detailsurah> getdetailsurahoffline(
      BuildContext context, int index) async {
    var getdata = await DefaultAssetBundle.of(context)
        .loadString('assets/model/surah/allsurah.json');
    var respon = await (jsonDecode(getdata.toString()) as List)[index - 1];

    return Detailsurah.fromJson(respon);
  }

  Future<DetailJuz> getdetailjuz(String index) async {
    Uri uri = Uri.parse("https://api.quran.gading.dev/juz/$index");
    try {
      var getdata = await http.get(uri);

      Map<String, dynamic> respon =
          (jsonDecode(getdata.body) as Map<String, dynamic>)['data'];
      var detailjuz = DetailJuz.fromJson(respon);
      return detailjuz;
    } catch (e) {
      // ignore: avoid_print
      print(e);
      return DetailJuz.fromJson({});
    }
  }

  @override
  void onInit() {
    scrollbody = ScrollController();
    scrollBehaviorbody = const ScrollBehavior();
    super.onInit();
  }
}
