import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:maksid_dictionaty/internet.dart';
import 'package:maksid_dictionaty/model/wordsLocalDataBase.dart';
import 'package:maksid_dictionaty/view/view-favorite/favorite.dart';
import '../../const/const.dart';
import 'package:provider/provider.dart';
import '../../functios.dart';
import '../home.dart';
import '../search-screen.dart';
import 'category-viewmodel.dart';

//class WordCategory
class WordCategory extends StatefulWidget {
  @override
  _WordCategoryState createState() => _WordCategoryState();
}

class _WordCategoryState extends State<WordCategory> {
  List<DropdownMenuItem> categories;
  String dropval = "all";
  List<Map> allCategories;
  IconData iconData = Icons.play_circle_fill_outlined;
  void _onPressed(CheckInternet provider, audioFile) {
    provider.isExists = false;
    setState(() {
      iconData = Icons.adjust_rounded;
    });
    play(audioFile, provider);
    setState(() {
      iconData = Icons.play_circle_fill_outlined;
    });
  }

  GetAllcategories() async {
    allCategories = await WordModel_service_database().getallcat();
    List<DropdownMenuItem> item2 = [];
    item2.add(DropdownMenuItem(
      child: GestureDetector(
          child: Center(
        child: Text(
          "all",
          textAlign: TextAlign.center,
          style: style("ar", 17.sp, FontWeight.w400, Colors.black),
        ),
      )),
      value: "all",
      onTap: () {},
    ));
    for (int i = 0; i < allCategories.length; i++) {
      item2.add(DropdownMenuItem(
        child: GestureDetector(
            child: Center(
          child: Text(
            allCategories[i]["cat"],
            textAlign: TextAlign.center,
            style: style("ar", 17.sp, FontWeight.w400, Colors.black),
          ),
        )),
        value: allCategories[i]["cat"],
        onTap: () {},
      ));
    }
    setState(() {
      categories = item2;
    });
  }

  @override
  void initState() {
    GetAllcategories();
  }

  String lung = Get.locale.toString();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CheckInternet>(context, listen: false);
    return ChangeNotifierProvider.value(
      value: WordCatProvider(),
      child: WillPopScope(
        onWillPop: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => home()));
        },
        child: Scaffold(
          body: SafeArea(
            child: Selector<WordCatProvider, List>(
              selector: (context, getWord) {
                getWord.fetchCatWordList(dropval);
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
                            Container(
                              margin: EdgeInsets.all(10.h),
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "My Words".tr,
                                    style: style(
                                      lung,
                                      25.sp,
                                      FontWeight.w500,
                                      Colors.black,
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.purple),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    width: 240.w,
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        items: categories,
                                        hint: Center(
                                            child: Text(
                                          "select category".tr,
                                          style: style(lung, 15,
                                              FontWeight.normal, Colors.black),
                                          textAlign: TextAlign.center,
                                        )),
                                        value: dropval,
                                        isExpanded: true,
                                        icon: Icon(
                                          Icons.arrow_drop_down_outlined,
                                          size: 20.r,
                                        ),
                                        onChanged: (val) {
                                          setState(() {
                                            dropval = val;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            WordList.length == 0
                                ? Container(
                                    margin: EdgeInsets.all(10.w),
                                    child: Column(
                                      children: [
                                        Text(
                                          "There are no saved my words entries yet. You can add entries by clicking the Add symbol inside the entry screen"
                                              .tr,
                                          style: style(lung, 17.sp,
                                              FontWeight.normal, Colors.black),
                                        ),
                                        Icon(Icons.add_circle_outline)
                                      ],
                                    ),
                                  )
                                : Flexible(
                                    fit: FlexFit.loose,
                                    child: Container(
                                      padding: EdgeInsets.only(
                                          right: 10.h, left: 10.h),
                                      child: ListView.builder(
                                        scrollDirection: Axis.vertical,
                                        itemCount: WordList.length,
                                        itemBuilder: (
                                          context,
                                          index,
                                        ) {
                                          return Material(
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            SearchScreen(
                                                                WordList[
                                                                    index])));
                                              },
                                              child: Column(
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          WordList[index]
                                                              .entryWithHarakat,
                                                          style: style(
                                                              "ar",
                                                              25.sp,
                                                              FontWeight.w500,
                                                              Colors
                                                                  .indigoAccent),
                                                        ),
                                                      ),
                                                      WordList[index].audioFile !=
                                                                  null &&
                                                              WordList[index]
                                                                      .audioFile !=
                                                                  ""
                                                          ? Expanded(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    iconData,
                                                                    color:
                                                                        kPrimaryColor,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _onPressed(
                                                                        provider,
                                                                        WordList[index]
                                                                            .audioFile);
                                                                  }),
                                                              flex: 1,
                                                            )
                                                          : Expanded(
                                                              child: IconButton(
                                                                  icon: Icon(
                                                                    Icons
                                                                        .play_circle_fill_outlined,
                                                                    color:
                                                                        kPrimaryColor,
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "This file is not exist , please try again later",
                                                                        toastLength:
                                                                            Toast
                                                                                .LENGTH_SHORT,
                                                                        gravity:
                                                                            ToastGravity
                                                                                .BOTTOM,
                                                                        timeInSecForIosWeb:
                                                                            1,
                                                                        backgroundColor:
                                                                            Colors
                                                                                .amberAccent,
                                                                        textColor:
                                                                            Colors
                                                                                .white,
                                                                        fontSize:
                                                                            16.0);
                                                                  }),
                                                              flex: 1,
                                                            ),
                                                      if (WordList[index]
                                                              .level !=
                                                          "")
                                                        Expanded(
                                                          child: Text(
                                                            convertlevel(
                                                                WordList[index]
                                                                    .level),
                                                            style: style(
                                                                "ar",
                                                                25.sp,
                                                                FontWeight.w500,
                                                                Colors.black),
                                                          ),
                                                          flex: 1,
                                                        ),
                                                      Expanded(
                                                        child: IconButton(
                                                            icon: Icon(
                                                              Icons.close,
                                                              color:
                                                                  kPrimaryColor,
                                                            ),
                                                            onPressed: () {
                                                              WordList[index]
                                                                  .cat = "all";
                                                              WordCatProvider()
                                                                  .updateWordCat(
                                                                      WordList[
                                                                          index]);
                                                            }),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    color: Colors.black38,
                                                    height: 1,
                                                  )
                                                ],
                                              ),
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
