import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// platform

class ScreenDimension {
  static double getWidth(BuildContext context, {double? width = 600.0}) {
    if (kIsWeb) return width ?? 0.0;
    if (Platform.isAndroid || Platform.isIOS) {
      return MediaQuery.of(context).size.width;
    }
    return 0.0;
  }
}
