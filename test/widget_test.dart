// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'dart:convert';

import 'package:alquran/app/data/modele/surah-modele.dart';
import 'package:http/http.dart' as http;

void main() async {
  var getdata = await http.get(Uri.parse(
      "https://al-quran-8d642.firebaseio.com/data.json?print=pretty"));
  List data = json.decode(getdata.body);
  data.map((e) => Surah.fromJson(e)).toList();

  // List<Map<String, dynamic>> tomodel = data[1];
  // List<Surah> surah = [];
  // data.forEach((element) {
  //   var hasil = element as Map<String, dynamic>;
  //   // print(hasil);
  //   surah.add(Surah.fromJson(hasil));
  // });
  // Future.delayed(Duration(seconds: 1), () {
  // });
  // print(data[1] as Map<String, dynamic>);
  // print(surah);
}
