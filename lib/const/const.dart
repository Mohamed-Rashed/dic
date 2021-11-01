import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final Color kPrimaryColor = HexColor("#a42f92");

BoxDecoration containerdecoration(Color bcolor, Color color, double bredius) {
  return BoxDecoration(
      border: Border.all(color: bcolor),
      color: color,
      borderRadius: BorderRadius.circular(bredius));
}

BoxDecoration decoration(bool sele) {
  return BoxDecoration(
      border: Border.all(color: Colors.purple),
      color: sele == true ? Colors.purple : Colors.white,
      borderRadius: BorderRadius.circular(25));
}

Container cont(String text, bool sele) {
  return Container(
    height: 35.h,
    width: 100.w,
    child: Center(
      child: Text(
        text,
        style: GoogleFonts.almarai(
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
            color: sele == true ? Colors.white : Colors.purple),
      ),
    ),
    decoration: decoration(sele),
    padding: EdgeInsets.only(right: 7.h, left: 7.h),
  );
}

Widget rowofTxt(String ftext, String stext, String lung) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:lung == "ar" ? MainAxisAlignment.start : MainAxisAlignment.start,
        children: [
          Text(
            ftext,
            style: style(lung, 14.sp, FontWeight.w400, Colors.black),
          ),
          SizedBox(width: 10,),
          Text(
            stext,
            style: style(lung, 17.sp, FontWeight.w400, Colors.black),
          ),
        ],
      ),
    ),
  );
}

String convertlevel(String level) {
  if (level == "0")
    return "lvl0".tr;
  else if (level == "1")
    return "lvl1".tr;
  else if (level == "2")
    return "lvl2".tr;
  else if (level == "3") return "lvl3".tr;
}

TextStyle style(
    String lung, double fontSize, FontWeight fontWeight, Color color) {
  if (lung == 'ar')
    return GoogleFonts.scheherazade(
      fontSize: fontSize + 2.h,
      fontWeight: fontWeight,
      color: color,
    );
  else
    return GoogleFonts.roboto(
        fontSize: fontSize, fontWeight: fontWeight, color: color);
}
