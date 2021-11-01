import 'dart:convert';

Todayword todaywordFromJson(String str) => Todayword.fromJson(json.decode(str));

class Todayword {
  Todayword({
    this.id,
    this.entryWithHarakat,
    this.audioFile,
    this.valueB,
  });

  int id;
  String entryWithHarakat;
  String audioFile;
  String valueB;

  factory Todayword.fromJson(Map<String, dynamic> json) => Todayword(
    id: json["ID"],
    entryWithHarakat: json["EntryWithHarakat"],
    audioFile: json["AudioFile"],
    valueB: json["ValueB"],
  );

}
