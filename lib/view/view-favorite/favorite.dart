import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maksid_dictionaty/model/words.dart';
import 'package:maksid_dictionaty/view/view-categorywords/viewcategory.dart';
import '../../const/const.dart';
import 'package:provider/provider.dart';

import '../../functios.dart';
import '../home.dart';
import '../search-screen.dart';
import 'favorite-viewmodel.dart';

class favoirte extends StatelessWidget {
  String lung = Get.locale.toString();
  final WordModel word;

  favoirte({Key key, this.word}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var dio = Dio();
    return ChangeNotifierProvider.value(
      value: WordProvider(),
      child: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        child: Scaffold(
          body: SafeArea(
            child: Selector<WordProvider, List>(
              selector: (context, getWord) {
                getWord.fetchfavWordList();
                return getWord.getWordList;
              },
              builder: (ctx, WordList, widget) {
                return WordList == null
                    ? SpinKitWave(
                        color: kPrimaryColor,
                        size: 50.0,
                      )
                    : Container(
                        width: double.infinity,
                        height: double.infinity,
                        padding: EdgeInsets.only(top: 10.sp),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/img/bg1-2.jpg"),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40.sp,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.sp),
                                    decoration: containerdecoration(
                                        kPrimaryColor, kPrimaryColor, 20.sp),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "Home".tr,
                                              style: style(
                                                  lung,
                                                  17.sp,
                                                  FontWeight.w500,
                                                  Colors.white),
                                            ),
                                            Icon(
                                              Icons.home,
                                              color: Colors.white,
                                              size: 15.r,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40.sp,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.sp),
                                    decoration: containerdecoration(
                                        kPrimaryColor, kPrimaryColor, 20.sp),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      favoirte()));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Text(
                                              "fav".tr,
                                              style: style(
                                                  lung,
                                                  17.sp,
                                                  FontWeight.w500,
                                                  Colors.white),
                                            ),
                                            Icon(
                                              Icons.favorite,
                                              color: Colors.white,
                                              size: 15.r,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10.sp,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    height: 40.sp,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.sp),
                                    decoration: containerdecoration(
                                        kPrimaryColor, kPrimaryColor, 20.sp),
                                    child: Material(
                                      color: Colors.transparent,
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WordCategory()));
                                        },
                                        child: Center(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "My Words".tr,
                                                style: style(
                                                    lung,
                                                    17.sp,
                                                    FontWeight.w500,
                                                    Colors.white),
                                              ),
                                              Icon(
                                                Icons.favorite,
                                                color: Colors.white,
                                                size: 15.r,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 37.h,
                                  child: Image(
                                    image: AssetImage("assets/img/logo.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "fav".tr,
                                    style: style(
                                      lung,
                                      25.sp,
                                      FontWeight.w500,
                                      Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Container(
                                padding:
                                    EdgeInsets.only(right: 10.h, left: 10.h),
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  itemCount: WordList.length,
                                  itemBuilder: (
                                    context,
                                    index,
                                  ) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SearchScreen(
                                                        WordList[index])));
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              WordList[index].entryWithHarakat,
                                              style: style(
                                                  "ar",
                                                  17.sp,
                                                  FontWeight.w500,
                                                  Colors.black),
                                            ),
                                          ),
                                          WordList[index].audioFile != null &&
                                                  WordList[index].audioFile !=
                                                      ""
                                              ? Expanded(
                                                  child: IconButton(
                                                    icon: Icon(
                                                      Icons.play_circle_fill,
                                                      color: kPrimaryColor,
                                                    ),
                                                    onPressed: () {
                                                      play(WordList[index]
                                                          .audioFile);
                                                      // play(WordList[index]
                                                      //     .audioFile);
                                                    },
                                                  ),
                                                  flex: 1,
                                                )
                                              : Expanded(
                                                  child: SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  flex: 1,
                                                ),
                                          if (WordList[index].level != "")
                                            Expanded(
                                              child: Text(
                                                convertlevel(
                                                    WordList[index].level),
                                                style: style(
                                                    "ar",
                                                    17.sp,
                                                    FontWeight.w500,
                                                    Colors.black),
                                              ),
                                              flex: 1,
                                            ),
                                          Expanded(
                                            child: IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  color: kPrimaryColor,
                                                ),
                                                onPressed: () {
                                                  WordList[index].fav = 0;
                                                  WordProvider().updateWord(
                                                      WordList[index]);
                                                }),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
