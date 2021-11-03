import 'package:flutter/cupertino.dart';
import 'package:maksid_dictionaty/model/words.dart';
import 'package:maksid_dictionaty/model/wordsLocalDataBase.dart';

class WordProvider extends ChangeNotifier{
  bool isOnline;
  List<WordModel> WordList = [];
  get getWordList => WordList;

  fetchfavWordList( )async{
    WordList=await WordModel_service_database().findFav();
    notifyListeners();
  }

  addWord(WordModel obj ) async {
    await WordModel_service_database().add(obj);
    notifyListeners();
  }

  updateWord(WordModel obj){
     WordModel_service_database().update(obj) ;
    notifyListeners();
  }

}