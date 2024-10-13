import 'dart:math';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_const.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: primaryswatch,
  scaffoldBackgroundColor: AppColor.scaffoldBackgroundColor,
  colorScheme: const ColorScheme.light(primary: AppColor.black),
  dialogBackgroundColor: AppColor.white,
  applyElevationOverlayColor: false,
  fontFamily: AppConst.APP_FONT,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
      side: const BorderSide(color: AppColor.primaryColor),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    ),
  ),
  popupMenuTheme: const PopupMenuThemeData(
    color: AppColor.scaffoldBackgroundColor,
    iconColor: AppColor.primaryColor,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColor.primaryColor,
    ),
  ),
  segmentedButtonTheme: SegmentedButtonThemeData(
    selectedIcon: const Icon(Icons.circle, size: 8.0, color: AppColor.primaryColor),
    style: SegmentedButton.styleFrom(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      selectedBackgroundColor: AppColor.secondaryColor.withOpacity(0.5),
    ),
  ),
  textSelectionTheme: TextSelectionThemeData(
    selectionColor: AppColor.secondaryColor.withOpacity(0.5),
  ),
  filledButtonTheme: FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColor.primaryColor,
      foregroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    ),
  ),
  iconButtonTheme: IconButtonThemeData(
      style:
          IconButton.styleFrom(backgroundColor: AppColor.white, foregroundColor: AppColor.black)),
  appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0.0,
      scrolledUnderElevation: 0,
      backgroundColor: AppColor.appBarColor,
      iconTheme: IconThemeData(color: AppColor.primaryColor),
      titleTextStyle:
          TextStyle(color: AppColor.black, fontFamily: AppConst.APP_FONT, fontSize: 16.0)),
  listTileTheme: const ListTileThemeData(titleTextStyle: TextStyle(color: AppColor.secondaryColor)),
  useMaterial3: true,
);

final primaryswatch = MaterialColor(AppColor.swatch.value, {
  50: tintColor(AppColor.swatch, 0.9),
  100: tintColor(AppColor.swatch, 0.8),
  200: tintColor(AppColor.swatch, 0.6),
  300: tintColor(AppColor.swatch, 0.4),
  400: tintColor(AppColor.swatch, 0.2),
  500: AppColor.swatch,
  600: shadeColor(AppColor.swatch, 0.1),
  700: shadeColor(AppColor.swatch, 0.2),
  800: shadeColor(AppColor.swatch, 0.3),
  900: shadeColor(AppColor.swatch, 0.4),
});

int tintValue(int value, double factor) =>
    max(0, min((value + ((255 - value) * factor)).round(), 255));

Color tintColor(Color color, double factor) => Color.fromRGBO(
    tintValue(color.red, factor), tintValue(color.green, factor), tintValue(color.blue, factor), 1);

int shadeValue(int value, double factor) => max(0, min(value - (value * factor).round(), 255));

Color shadeColor(Color color, double factor) => Color.fromRGBO(shadeValue(color.red, factor),
    shadeValue(color.green, factor), shadeValue(color.blue, factor), 1);
