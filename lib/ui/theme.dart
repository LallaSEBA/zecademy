import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeConfig{
  static const Color colorBody         = Color(0xffF5F5F5);
  static const Color colorBorders      = Color(0xffEEEEEE);
  static const Color colorItemRectgl   = Color(0xffFFFFFF);

  static const Color colorTitles       = Color(0xff141414);
  static const Color colorSubTitles    = Color(0xff8C8C8C);
  static const Color colorButtons      = Color(0xff7000FF);
  static const Color colorNavBar       = Color(0xffAAAAAA);

  static const Color colorIndicator    = Color(0xff828282);
  static const Color colorError        = Color(0xffEC5757);

  
  static const FontWeight fntWAppBTitle  = FontWeight.w400;
  static const FontWeight fntWTitles     = FontWeight.w500;
  static const FontWeight fntWSubTitles  = FontWeight.w400;
  static const double fntSizeAppB        = 20;
  static const double fntSizeTitU        = 24;
  static const double fntSizeSubTitU     = 16;
  static const double fntSizeTitList     = 16;
  static const double fntSizeDetail      = 14;
  static const double fntSizeDetailList  = 12;
  static const double fntSizeNavBr       = 12;
  static const String fntFamilyApp  = 'Roboto';

  static const TextStyle txtStyleAppBTit    = TextStyle(color: colorTitles,       fontSize: fntSizeAppB,       fontWeight: fntWAppBTitle);
  static const TextStyle txtStyleTitU       = TextStyle(color: colorTitles,       fontSize: fntSizeTitU,       fontWeight: fntWTitles);
  static const TextStyle txtStyleSubTitU    = TextStyle(color: colorSubTitles,    fontSize: fntSizeSubTitU,    fontWeight: fntWSubTitles);
  static const TextStyle txtStyleTitDetailU = TextStyle(color: colorSubTitles,    fontSize: fntSizeDetail,     fontWeight: fntWSubTitles);
  static const TextStyle txtStyleDetailU    = TextStyle(color: colorTitles,       fontSize: fntSizeDetail,     fontWeight: fntWSubTitles);

  static const TextStyle txtStyleTitListU   = TextStyle(color: colorTitles,       fontSize: fntSizeTitList,    fontWeight: fntWTitles);
  static const TextStyle txtStyleSubTitList = TextStyle(color: colorSubTitles,    fontSize: fntSizeDetailList, fontWeight: fntWSubTitles);
  static const TextStyle txtStyleButton     = TextStyle(color: colorButtons,      fontSize: fntSizeDetailList, fontWeight: fntWSubTitles,);
  static const TextStyle txtStyleNavBar     = TextStyle(color: colorNavBar,       fontSize: fntSizeNavBr,      fontWeight: fntWSubTitles,);

  static const TextStyle txtStyleLoading    = TextStyle(color: colorIndicator,    fontSize: fntSizeTitList,    fontWeight: fntWTitles);
  static const TextStyle txtStyleErrorData  = TextStyle(color: colorError,        fontSize: fntSizeDetail,     fontWeight: fntWTitles);
  static const TextStyle txtStyleNavBarActv = TextStyle(color: colorButtons,      fontSize: fntSizeNavBr,      fontWeight: fntWSubTitles,);

   static const double cardRadius     = 8.0;
   static const double borderRadius   = 4.0;
}