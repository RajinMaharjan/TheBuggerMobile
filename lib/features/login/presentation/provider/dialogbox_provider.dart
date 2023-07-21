import 'package:flutter/material.dart';

class DialogProvider extends ChangeNotifier {
  Orientation deviceOrientation(BuildContext context) {
    return MediaQuery.of(context).orientation;
  }

  bool isTablet(BuildContext context) {
    final shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide >= 600;
  }

  double getDialogWidth(BuildContext context) {
    final isLandscape = deviceOrientation == Orientation.landscape;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    if (isTablet(context)) {
      return isLandscape ? mediaQueryHeight * 0.22 : mediaQueryHeight * 0.18;
    } else {
      return mediaQueryHeight * 0.12;
    }
  }

  double getDialogHeight(BuildContext context) {
    final isLandscape = deviceOrientation == Orientation.landscape;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    if (isTablet(context)) {
      return isLandscape ? mediaQueryHeight * 0.06 : mediaQueryHeight * 0.051;
    } else {
      return mediaQueryHeight * 0.04;
    }
  }

  double getDialogTitleFontSize(BuildContext context) {
    final isLandscape = deviceOrientation == Orientation.landscape;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    if (isTablet(context)) {
      return isLandscape ? mediaQueryHeight * 0.055 : mediaQueryHeight * 0.03;
    } else {
      return mediaQueryHeight * 0.027;
    }
  }

  double getDialogContentFontSize(BuildContext context) {
    final isLandscape = deviceOrientation == Orientation.landscape;
    final mediaQueryHeight = MediaQuery.of(context).size.height;

    if (isTablet(context)) {
      return isLandscape ? mediaQueryHeight * 0.04 : mediaQueryHeight * 0.025;
    } else {
      return mediaQueryHeight * 0.025;
    }
  }
}
