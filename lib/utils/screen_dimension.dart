import 'package:flutter/material.dart';
// platform

class ScreenDimension {
  static double getWidth(BuildContext context, {double? width = 600.0}) {
    if (MediaQuery.of(context).size.width >= 600.0) {
      return width ?? 0.0;
    }
    return MediaQuery.of(context).size.width;
  }

  static bool isMobileView(BuildContext context) {
    return MediaQuery.of(context).size.width < 600.0;
  }

  static bool isTabletView(BuildContext context) {
    return MediaQuery.of(context).size.width < 880.0;
  }
}
