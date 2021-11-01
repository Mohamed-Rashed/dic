import 'dart:convert';

ListOfWordModels ListOfWordModelsFromJson(String str) =>
    ListOfWordModels.fromJson(json.decode(str));

class ListOfWordModels {
  ListOfWordModels({
    this.total,
    this.data,
  });
  
  int total;
  List<dynamic> data;

  factory ListOfWordModels.fromJson(Map<String, dynamic> json) => ListOfWordModels(
        total: json["total"],
        data: json["data"],
      );
}

 

String barangToMap(WordModel data) => json.encode(data.toMap());

class WordModel {
  WordModel({
    this.id,
    this.entryWithHarakat,
    this.entry,
    this.poSpeech,
    this.meaning,
    this.examples,
    this.gender,
    this.oppGender,
    this.sing,
    this.du,
    this.plu,
    this.pluFem,
    this.plPlu,
    this.kNoun,
    this.synonyms,
    this.antonyms,
    this.eng,
    this.tr,
    this.img,
    this.level,
    this.root,
    this.past,
    this.present,
    this.phrasesConjugations,
    this.imperative,
    this.comparative,
    this.gerund,
    this.semField,
    this.plusNoun,
    this.plusAdj,
    this.plusPrep,
    this.plusVerb,
    this.usageNotes,
    this.culture,
    this.audioFile,
    this.mistakenSearch,
    this.fav,
    this.cat
  });

  int id,fav;
  String entryWithHarakat, entry, poSpeech, meaning, examples, gender, oppGender, sing,
      du, plu, pluFem, plPlu, kNoun, synonyms, antonyms, eng, tr, img, level, root, past, present,
      phrasesConjugations, imperative, comparative, gerund, semField, plusNoun,cat,
      plusAdj, plusPrep, plusVerb, usageNotes, culture, audioFile, mistakenSearch;


  factory WordModel.fromJson(Map<String, dynamic> json) => WordModel(
        id: json["ID"],
        fav:json["fav"] == null ? 0 :json["fav"],
        cat: json["cat"] == null ? "all" :json["cat"],
        entryWithHarakat: json["EntryWithHarakat"],
        entry: json["Entry"],
        poSpeech: json["PoSpeech"],
        meaning: json["Meaning"],
        examples: json["Examples"],
        gender: json["Gender"],
        oppGender: json["OppGender"],
        sing: json["Sing"],
        du: json["Du"],
        plu: json["Plu"],
        pluFem: json["PluFem"],
        plPlu: json["PlPlu"],
        kNoun: json["KNoun"],
        synonyms: json["Synonyms"],
        antonyms: json["Antonyms"],
        eng: json["Eng"],
        tr: json["Tr"],
        img: json["Img"],
        level: json["Level"],
        root: json["Root"],
        past: json["Past"],
        present: json["Present"],
        phrasesConjugations: json["PhrasesConjugations"],
        imperative: json["Imperative"],
        comparative: json["Comparative"],
        gerund: json["Gerund"],
        semField: json["SemField"],
        plusNoun: json["PlusNoun"],
        plusAdj: json["PlusAdj"],
        plusPrep: json["PlusPrep"],
        plusVerb: json["PlusVerb"],
        usageNotes: json["UsageNotes"],
        culture: json["Culture"],
        audioFile: json["AudioFile"],
        mistakenSearch: json["MistakenSearch"],
      );
  Map<String, dynamic> toMap() => {
    "ID": id,
    "fav":fav,
    "cat":cat,
    "EntryWithHarakat": entryWithHarakat,
    "Entry": entry,
    "PoSpeech": poSpeech,
    "Meaning": meaning,
    "Examples": examples,
    "Gender": gender,
    "OppGender": oppGender,
    "Sing": sing,
    "Du": du,
    "Plu": plu,
    "PluFem": pluFem,
    "PlPlu": plPlu,
    "KNoun": kNoun,
    "Synonyms": synonyms,
    "Antonyms": antonyms,
    "Eng": eng,
    "Tr": tr,
    "Img": img,
    "Level": level,
    "Root": root,
    "Past": past,
    "Present": present,
    "PhrasesConjugations": phrasesConjugations,
    "Imperative": imperative,
    "Comparative":  comparative,
    "Gerund":  gerund,
    "SemField": semField,
    "PlusNoun":  plusNoun,
    "PlusAdj":  plusAdj,
    "PlusPrep": plusPrep,
    "PlusVerb":  plusVerb,
    "UsageNotes": usageNotes,
    "Culture": culture,
    "AudioFile": audioFile,
    "MistakenSearch": mistakenSearch,
  };
}
