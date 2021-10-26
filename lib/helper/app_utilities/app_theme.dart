import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

ThemeData get defaultAppThemeData1 => ThemeData(
  fontFamily: "SF-UI-Text-Regular",
  primaryColor: Color(0xff5AC8FA),
  accentColor: Color(0xffF27D98),
  canvasColor: Color(0xff4A4A4A),
  buttonColor: Color(0xffF27D98),
  buttonTheme: ButtonThemeData(
    buttonColor: Color(0xffF27D98),
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
        fontFamily: 'SF-UI-Display-Bold',
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Color(0xffFDFFFF)),
    headline2: TextStyle(
      fontFamily: 'Montserrat-SemiBold',
      fontSize: 16.0,
      // color: Color(0xffFDFFFF),
      color: Colors.white70,
    ),
    bodyText1: TextStyle(
      fontFamily: 'SF-UI-Text-Regular',
      fontSize: 14.0,
      color: Colors.white70,
      // color: Color(0xffFDFFFF),
    ),
    bodyText2: TextStyle(
      fontFamily: 'helveticaneue',
      fontSize: 20.0,
      color: Color(0xffF5B65E),
      // color: Color(0xffFFFFFF),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);

ThemeData get defaultAppThemeData => ThemeData(
    fontFamily: AppFonts.textRegular,
    primarySwatch: materialPrimaryColor,
    accentColor: materialAccentColor,
    // scaffoldBackgroundColor: CupertinoColors.extraLightBackgroundGray,
    appBarTheme: AppBarTheme().copyWith(brightness: Brightness.dark),
    platform: TargetPlatform.android,
    iconTheme: IconThemeData(color: Colors.white),
    primaryIconTheme: IconThemeData(color: Colors.white));


const MaterialColor materialPrimaryColor = const MaterialColor(
  0xff4A4A4A,
  const <int, Color>{
    50: const Color(0xff4A4A4A),
    100: const Color(0xff4A4A4A),
    200: const Color(0xff4A4A4A),
    300: const Color(0xff4A4A4A),
    400: const Color(0xff4A4A4A),
    500: const Color(0xff4A4A4A),
    600: const Color(0xff4A4A4A),
    700: const Color(0xff4A4A4A),
    800: const Color(0xff4A4A4A),
    900: const Color(0xff4A4A4A),
  },
);

/*
* New colors added to make ui more clean
* */

const textColorPrimary = Color(0xFF444444);
const cboGrey = Color(0xFFF2F2F2);
const widgetViewColor = Color(0xFFEEEEF1);
const layout_background = Color(0xFFF6F7FA);
const dbShadowColor = Color(0x95E9EBF0);
const appIconTint_sky_blue = Color(0xFF73d8d4);
const appIconTint_mustard_yellow = Color(0xFFffc980);
const appIconTintDark_purple = Color(0xFF8998ff);
const appTxtTintDark_purple = Color(0xFF515BBE);
const appIconTintDarkCherry = Color(0xFFf2866c);
const appIconTintDark_sky_blue = Color(0xFF73d8d4);
const appDark_parrot_green = Color(0xFF5BC136);
const appDarkRed = Color(0xFFF06263);
const appLightRed = Color(0xFFF89B9D);
const bluePurple = Color(0xFF8998FE);
const catOrange = Color(0xFFFF9781);
const greenBlue = Color(0xFF73D7D3);
const skyBlue = Color(0xFF87CEFA);

Color get primaryColor => materialPrimaryColor;

Color get primaryRed => Colors.red;

Color get primaryRed20 => Colors.red.shade200;

Color get primaryRed40 => Colors.red.shade400;

Color get primaryRed60 => Colors.red.shade600;

// Color get materialAccentColor => Color(0xffFDC800);
Color get materialAccentColor =>Color(0xffF27D98);
//from old app
// Color get materialAccentColor => Color(0xff267b1b);

Color get textBlueDark => Color(0xff3051A0);

Color get categoryIconCyan => Color(0xff1bbef9);

Color get categoryTitleGrayDark => Color(0xff707070);

Color get categoryCardBg => Color(0xffe6ecf2);

Color get lightDividerColor => Colors.grey.shade200;

Color get borderSideColor => Colors.black26;

Color get borderSideFocusedColor => primaryColor;

Color get lightGrey50 => Colors.grey.shade50;

Color get whiteColor => Colors.white;

MaterialColor get randomColor => Colors.primaries[Random().nextInt(Colors.primaries.length)];

abstract class AppFonts {
  static String  textRegular = 'SF-UI-Text-Regular';
  static String  textBold = 'SF-UI-Display-Bold';
  static String  textSemiBold = 'Montserrat-SemiBold';
  static String  textRegular1 = 'helveticaneue';
}
