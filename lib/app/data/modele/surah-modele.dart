// To parse this JSON data, do
//
//     final surah = surahFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

Surah surahFromJson(String str) => Surah.fromJson(json.decode(str));

String surahToJson(Surah data) => json.encode(data.toJson());

class Surah {
  Surah({
    this.arti,
    this.asma,
    this.ayat,
    this.nama,
    this.nomor,
    this.urut,
  });

  String? arti;
  String? asma;
  int? ayat;
  String? nama;
  String? nomor;
  String? urut;

  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
        arti: json["arti"],
        asma: json["asma"],
        ayat: json["ayat"],
        nama: json["nama"],
        nomor: json["nomor"],
        urut: json["urut"],
      );

  Map<String, dynamic> toJson() => {
        "arti": arti,
        "asma": asma,
        "ayat": ayat,
        "nama": nama,
        "nomor": nomor,
        "urut": urut,
      };
}
