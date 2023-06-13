// To parse this JSON data, do
//
//     final detailsurah = detailsurahFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<Detailsurah> detailsurahFromJson(String str) => List<Detailsurah>.from(
    json.decode(str).map((x) => Detailsurah.fromJson(x)));

String detailsurahToJson(List<Detailsurah> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Detailsurah {
  Detailsurah({
    this.id,
    this.name,
    this.transliteration,
    this.translation,
    this.type,
    this.totalVerses,
    this.verses,
  });

  int? id;
  String? name;
  String? transliteration;
  String? translation;
  String? type;
  int? totalVerses;
  List<Verse>? verses;

  factory Detailsurah.fromJson(Map<String, dynamic> json) => Detailsurah(
        id: json["id"],
        name: json["name"],
        transliteration: json["transliteration"],
        translation: json["translation"],
        type: json["type"],
        totalVerses: json["total_verses"],
        verses: List<Verse>.from(json["verses"].map((x) => Verse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "transliteration": transliteration,
        "translation": translation,
        "type": type,
        "total_verses": totalVerses,
        "verses": List<dynamic>.from(verses!.map((x) => x.toJson())),
      };
}

class Verse {
  Verse({
    this.id,
    this.text,
    this.translation,
  });

  int? id;
  String? text;
  String? translation;

  factory Verse.fromJson(Map<String, dynamic> json) => Verse(
        id: json["id"],
        text: json["text"],
        translation: json["translation"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "text": text,
        "translation": translation,
      };
}
