import 'dart:convert';

import 'package:alquran/app/data/modele/juzmodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/modele/surah-modele.dart';

class HomeController extends GetxController {
  //varialble
  var listviewindex = 0.obs;
  var indexhome = 1.obs;
  var onsearch = false.obs;
  var slidepage = 0.obs;
  var indexsurahjuz = 0.obs;
  var heigt = [].obs;

  //controller
  DateTime datenow = DateTime.now();
  late TextEditingController searchhome;
  late FocusNode focusnodesearch;
  late ScrollController scrollberanda;
  late PageController surahjuz;

  //fungsi
  Future<List<Surah>> getAllsurah(BuildContext context) async {
    var getdata = await DefaultAssetBundle.of(context)
        .loadString("assets/model/listsurah.json");

    List? data = jsonDecode(getdata.toString());
    return data!.map((e) => Surah.fromJson(e)).toList();
  }

  Future<List<Juz>> getAlljuz(BuildContext context) async {
    var getdata = await DefaultAssetBundle.of(context)
        .loadString("assets/model/juz1.json");

    List data = jsonDecode(getdata.toString());
    return data.map((e) => Juz.fromJson(e)).toList();
  }

  @override
  void onInit() {
    searchhome = TextEditingController();
    focusnodesearch = FocusNode();
    scrollberanda = ScrollController();
    surahjuz = PageController();
    super.onInit();
  }
}
