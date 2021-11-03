import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:maksid_dictionaty/internet.dart';
import 'package:path_provider/path_provider.dart';




play(String url, CheckInternet provider) async {
  var dio = Dio();

  AudioPlayer player = new AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  final audioUrl = "https://maksid.com/aud/" + url;

  Directory appDocDir = await getApplicationDocumentsDirectory();
  String path = appDocDir.path;

  //String fullPath = tempDir.path + "/boo2.pdf'";
  String fullPath = "$path/$url";

  if (File(fullPath).existsSync()) {

    player.play(fullPath);
  } else {
    try {
      provider.isExists = false;
      Response response = await dio.get(
        audioUrl,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      File file = File(fullPath);
      var raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      provider.isExists = true;
      player.play(fullPath, isLocal: true);
      await raf.close();
    } catch (e) {
      provider.isExists = false;
      print(e);
    }
  }
}
