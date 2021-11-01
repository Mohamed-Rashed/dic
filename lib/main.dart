import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:maksid_dictionaty/view/splash.dart';
import 'const/translation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 877),
      allowFontScaling: true,
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maksid Dictionary',
        home: Splash(),
        translations: Translation(),
        locale: Locale('en'),
        fallbackLocale: Locale('en'),
      ),
    );
  }
}
