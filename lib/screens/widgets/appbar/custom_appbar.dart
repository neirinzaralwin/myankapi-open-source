import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_pages.dart';

AppBar? customAppBar() {
  return kIsWeb
      ? null
      : AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: AppColor.scaffoldBackgroundColor,
          title: Row(
            children: [
              IconButton.filled(
                  onPressed: () => AppPages.router.pop(),
                  icon: const Icon(Icons.arrow_back_rounded)),
            ],
          ),
        );
}
