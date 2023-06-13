// To parse this JSON data, do
//
//     final juz = juzFromJson(jsonString);

import 'dart:convert';

Juz juzFromJson(String str) => Juz.fromJson(json.decode(str));

String juzToJson(Juz data) => json.encode(data.toJson());

class Juz {
  Juz({
    this.index,
    this.start,
    this.end,
  });

  String? index;
  End? start;
  End? end;

  factory Juz.fromJson(Map<String, dynamic> json) => Juz(
        index: json["index"],
        start: End.fromJson(json["start"]),
        end: End.fromJson(json["end"]),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "start": start!.toJson(),
        "end": end!.toJson(),
      };
}

class End {
  End({
    this.index,
    this.verse,
    this.name,
  });

  String? index;
  String? verse;
  String? name;

  factory End.fromJson(Map<String, dynamic> json) => End(
        index: json["index"],
        verse: json["verse"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "verse": verse,
        "name": name,
      };
}
