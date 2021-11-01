import 'package:flutter/cupertino.dart';
import 'package:maksid_dictionaty/model/words.dart';
import 'package:maksid_dictionaty/model/wordsLocalDataBase.dart';

class WordCatProvider extends ChangeNotifier{
  List<WordModel> WordList = [];
  get getWordList => WordList;

  fetchCatWordList(String cat )async{
    WordList=await WordModel_service_database().findcatwords(cat);
    notifyListeners();
  }

  addWord(WordModel obj ) async {
    await WordModel_service_database().add(obj);
    notifyListeners();
  }

  updateWordCat(WordModel obj){
    WordModel_service_database().update(obj) ;
    notifyListeners();
  }

}