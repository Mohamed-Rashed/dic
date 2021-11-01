import 'dart:convert';
import 'package:connectivity_widget/connectivity_widget.dart';
import 'package:flutter/material.dart';
import 'package:maksid_dictionaty/model/todayword.dart';
import 'package:maksid_dictionaty/service/words-services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import '../const/const.dart';
import 'home.dart';
import 'package:http/http.dart' as http;

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  SharedPreferences prefs;
  fun() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("last") == null) {
      await WordApi.fetchSurList();
      prefs.setString("last", DateTime.now().toString());
    } else {
      if (DateTime.now()
              .difference(DateTime.parse(prefs.getString("last")))
              .inDays >=
          1) {
        await WordApi.fetchSurList();
        prefs.setString("last", DateTime.now().toString());
      } else {}
    }
  }

  Todayword todayword;
  fetchTodayword() async {
    try {
      var url = 'https://maksid.com/mobapp/getwod.php?j=g';
      final response = await http.get(url);
      final extractedData = json.decode(response.body);
      if (extractedData != null) {
        todayword = Todayword.fromJson(extractedData);
        prefs.setInt("id", todayword.id);
      } else {}
    } catch (e) {
      print(e);
      return null;
    }
  }

  todaywordcheck() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString("todaycheck") == null) {
      fetchTodayword();
      prefs.setString("todaycheck", DateTime.now().toString());
    } else {
      DateTime d = DateTime.now(),
          old = DateTime.parse(prefs.getString("todaycheck"));
      if (d.year > old.year || d.month > old.month || d.day > old.day) {
        fetchTodayword();
        prefs.setString("todaycheck", DateTime.now().toString());
      } else {}
    }
  }

  @override
  void initState() {
    fun();
    todaywordcheck();
  }

  Widget noInternetConnection() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/img/internet.png"),
            Text("No Internet Please Check your Internet Connrction"),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
        home: ConnectivityWidget(
          builder: (context, isOnline) => Column(
              children:[

                SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: home()),
              ],
            ),
        ),
        duration: 6500,
        imageSize: 150,
        textType: TextType.ColorizeAnimationText,
        imageSrc: "assets/img/logo.png",
        text: "Maksid Dictionary",
        colors: [
          kPrimaryColor,
          Colors.white,
          kPrimaryColor.withOpacity(0.5),
        ],
      );
  }
}

/* OfflineBuilder(
          connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
          ) {
            final bool connected = connectivity != ConnectivityResult.none;
            if (connected) {
              return home();
            } else {
              return noInternetConnection();
            }
          },
          child: Center(
            child: CircularProgressIndicator(),
          ),
        )*/
