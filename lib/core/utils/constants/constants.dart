import 'package:flutter/material.dart';

// normal fontsize
double defultFontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.02;
}

// tablet fontsize
double tabletFontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.023;
}

// icon moible size
double iconSizeMobile(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.023;
}

// icon tablet size
double iconSizeTablet(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.027;
}

double iconSizeTabletLandscape(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.04;
}

// padding for tablet 30
double paddingTablet20(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.02;
}

double paddingTablet30(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.025;
}

double paddingTablet40(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.04;
}

double paddingTablet50(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.05;
}

double paddingTabletLandscape35(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.035;
}

// padding for mobile 10
double paddingMobile10(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.012;
}

double tabletLandscapeFontSize(BuildContext context) {
  return MediaQuery.of(context).size.height * 0.031;
}

// App Colors
class AppColor {
  static const backgroundColor = Colors.white;
  static const cardColor = Color.fromARGB(238, 241, 243, 245);
  static const Color titleTextColor = Color(0xff000000);
  static const Color buttonColor = Color(0xFFF9A825);
  static const Color drawerColor = Color(0xff1687A7);
  static const Color bottomNavBarSelectedColor = Color(0xff276678);
}

// hint teststyle
TextStyle hintStyle(
    {double? fontSize,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: overflow,
  );
}

// lable style
TextStyle labelStyles(
    {double? fontSize,
    BuildContext? context,
    Color? color,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextOverflow? overflow}) {
  return TextStyle(
    fontSize: fontSize,
    color: color,
    fontWeight: fontWeight,
    letterSpacing: letterSpacing,
    overflow: overflow,
  );
}

// Media Querry height
double mediaQueryHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

// Medai Querry Width
double mediaQueryWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

//  Sized Box With height 10
Widget commonSizedBox(BuildContext context) {
  return SizedBox(
    height: mediaQueryHeight(context) * 0.02,
  );
}

// Check isTablet Or Not
bool isTablet(BuildContext context) {
  final shortesSide = MediaQuery.of(context).size.shortestSide;
  return shortesSide >= 600;
}

// Image Path
class ImagePath {
  // static const qaLintLogo = 'assets/images/qa_lint_logo.png';
  static const googleLogo = 'assets/images/google.png';
  static const logoQaLint = 'assets/images/logo.png';
  static const noInternet = 'assets/images/no_internet.png';
  static const retry = 'assets/images/retry.png';
  static const logout = 'assets/images/logout.png';
  static const quizPassed = 'assets/images/pass-examination.png';
  static const quizFailed = 'assets/images/fail-examination.png';
  static const bugger_logo = 'assets/images/bugger_logo.png';
  static const bugger = 'assets/images/bugger.png';
  static const tb_logo = 'assets/images/tb_logo.png';
}

// materiail Colors
const MaterialColor customPrimarySwatch = MaterialColor(
  0xFFF9A825, // Replace with the desired color's hexadecimal value
  <int, Color>{
    50: Color(0xFFF9A825),
    100: Color(0xFFF9A825),
    200: Color(0xFFF9A825),
    300: Color(0xFFF9A825),
    400: Color(0xFFF9A825),
    500: Color(0xFFF9A825),
    600: Color(0xFFF9A825),
    700: Color(0xFFF9A825),
    800: Color(0xFFF9A825),
    900: Color(0xFFF9A825),
  },
);
