import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:maksid_dictionaty/model/todayword.dart';
import 'package:maksid_dictionaty/model/words.dart';
import 'package:maksid_dictionaty/model/wordsLocalDataBase.dart';

class WordApi {
  static fetchSurList() async {
    int c = 0, total = 100;
    while (c < total) {
      try {
        var url = 'https://maksid.com/mobapp/get_entries.php?j=r&t=100&c=$c';
        final response = await http.get(url);
        final extractedData = json.decode(response.body);
        if (response.statusCode == 200) {
          ListOfWordModels wList = ListOfWordModels.fromJson(extractedData);
          total = wList.total;
          List wordList = [];
          wordList = wList.data.map((e) => WordModel.fromJson(e)).toList();
          c += wordList.length + 1;
          for (int i = 0; i < wordList.length; i++) {
            await WordModel_service_database().add(wordList[i]);
          }
        }
      } catch (e) {
        print(e);
      }
    }
  }
}

class todayApi {
  fetchTodayword() async {
    try {
      var url = 'https://maksid.com/mobapp/getwod.php?j=g';
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData != null) {
        Todayword.fromJson(extractedData);
      } else {}
    } catch (e) {
      print(e);
      return null;
    }
  }
}
