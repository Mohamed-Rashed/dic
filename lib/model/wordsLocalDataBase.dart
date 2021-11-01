import 'package:maksid_dictionaty/model/words.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class WordModel_service_database{
  String table = 'WordDB';
   static Database _db;
  Future<Database> get db async{
    if(_db == null){
      _db = await initialDB();
      return _db;
    }else{
      return _db;
    }
  }

  initialDB() async{
    io.Directory docDirect = await getApplicationDocumentsDirectory();
    String path = join(docDirect.path,'WordModeldb.db');
    var mydb = await openDatabase(path,version: 1,onCreate: (Database db,int version) async{
       await db.execute('CREATE TABLE "$table" '
           '("ID" INTEGER PRIMARY KEY NOT NULL,'
           '"fav" INTEGER,'
           '"EntryWithHarakat" Text NOT NULL,'
           '"Entry" Text NOT NULL,'
           '"PoSpeech" Text NOT NULL,'
           '"Meaning" Text NOT NULL,'
           '"Examples" Text NOT NULL,'
           '"Gender" Text NOT NULL,'
           '"OppGender" Text NOT NULL,'
           '"Sing" Text NOT NULL,'
           '"Du" Text NOT NULL,'
           '"Plu" Text NOT NULL,'
           '"PluFem" Text NOT NULL,'
           '"PlPlu" Text NOT NULL,'
           '"KNoun" Text NOT NULL,'
           '"Synonyms" Text NOT NULL,'
           '"Antonyms" Text NOT NULL,'
           '"Eng" Text NOT NULL,'
           '"cat" Text NOT NULL,'
           '"Tr" Text NOT NULL,'
           '"Img" Text NOT NULL,'
           '"Level" Text NOT NULL,'
           '"Root" Text NOT NULL,'
           '"Past" Text NOT NULL,'
           '"Present" Text NOT NULL,'
           '"PhrasesConjugations" Text NOT NULL,'
           '"Imperative" Text NOT NULL,'
           '"Comparative" Text NOT NULL,'
           '"Gerund" Text NOT NULL,'
           '"SemField" Text NOT NULL,'
           '"PlusNoun" Text NOT NULL,'
           '"PlusAdj" Text NOT NULL,'
           '"PlusPrep" Text NOT NULL,'
           '"PlusVerb" Text NOT NULL,'
           '"UsageNotes" Text NOT NULL,'
           '"Culture" Text NOT NULL,'
           '"AudioFile" Text NOT NULL,'
           '"MistakenSearch" Text NOT NULL)');
       await db.execute('CREATE TABLE "cat" ("cat" Text PRIMARY KEY NOT NULL)');


    });

    return mydb;
  }

  //add || insert
  Future<bool> add(WordModel object) async {
    Database db1 = await this.db;
    List ret=await db1.rawQuery('SELECT * FROM WordDB where ID = ${object.id}');
    if(ret.length>0)
      return false;
    else
    {
      await db1.insert('WordDB', object.toMap());
      return true;
    }
  }

  //Search
  Future<WordModel> find(int id)async{
    var dbclient=await db;
    List<Map> list2 = await dbclient.rawQuery('SELECT * FROM WordDB where ID = $id ');
    List<WordModel> list=new List<WordModel>();
    for(int i=0;i<list2.length;i++)
    {
      list.add(WordModel.fromJson(list2[i]));
    }
    return  list[0];
  }

  Future<List<WordModel>> findFav( )async{
    var dbclient=await db;
    List<Map> list2 = await dbclient.rawQuery('SELECT * FROM WordDB where fav = 1 ');
    List<WordModel> list=new List<WordModel>();
    for(int i=0;i<list2.length;i++)
    {
      list.add(WordModel.fromJson(list2[i]));
    }
    return  list;
  }
  Future<List<WordModel>> findcatwords(String cat)async{
    var dbclient=await db;
    List<Map> list2=[];
    if(cat=="all")
     list2 = await dbclient.rawQuery('SELECT * FROM WordDB where cat != "all" ');
   else
      list2 = await dbclient.rawQuery('SELECT * FROM WordDB where cat = "$cat" ');
   List<WordModel> list=new List<WordModel>();
   for(int i=0;i<list2.length;i++)
    {
      list.add(WordModel.fromJson(list2[i]));
    }
    return  list;
  }


  //getAll
  Future<List<WordModel>> getWordModel() async{
    var dbclient=await db;
    List<Map> list2 = await dbclient.rawQuery('SELECT * FROM WordDB');
    List<WordModel> list=new List<WordModel>();
    for(int i=0;i<list2.length;i++)
    {
      list.add(WordModel.fromJson(list2[i]));
    }

    return list;
  }

  deleteall()async{
    var dbclient=await db;
    await dbclient.rawQuery('DELETE from WordDB');
  }


  //Update iteam
  void update(WordModel object)async{
    Database db1 = await this.db;
    await db1.update('WordDB', object.toMap(), where: 'ID=?', whereArgs: [object.id]);
  }
  void addcat(String cat)async{
    Database db1 = await this.db;
    await db1.insert("cat", {'cat': "$cat"});
  }
  Future<List<Map>> getallcat() async{
    var dbclient=await db;
    List<Map> list2 = await dbclient.rawQuery('SELECT * FROM cat');
    return list2;
  }
}
