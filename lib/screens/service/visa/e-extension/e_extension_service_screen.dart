import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/img_const.dart';
import 'package:myankapi/core/enum/file_format_enum.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class EextensionServiceScreen extends StatefulWidget {
  const EextensionServiceScreen({super.key});

  @override
  State<EextensionServiceScreen> createState() =>
      _EextensionServiceScreenState();
}

class _EextensionServiceScreenState extends State<EextensionServiceScreen> {
  final cardPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: (kIsWeb)
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
            ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
        child: Column(
          children: [
            if (kIsWeb) const SizedBox(height: 10.0),
            Align(
                alignment: Alignment.centerLeft,
                child: const Text('E-extension Service')
                    .headLarge
                    .bold
                    .primaryColor),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(cardPadding),
              decoration: BoxDecoration(
                color: AppColor.veryMildGreen,
                borderRadius: BorderRadius.circular(10.0 + cardPadding),
                border: Border.all(color: AppColor.primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Row(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Passport',
                    ).headSmall,
                  ),
                  const SizedBox(height: 25.0),
                  Image.asset(
                    ImgConst.passport,
                    width: 100,
                  ),
                  const SizedBox(height: 25.0),
                  _fileUploadWidget(
                      title: "Bio page",
                      formats: "${FileFormat.values.map((e) => e.name)}",
                      image: Image.asset(ImgConst.passportBio),
                      onPressed: () {}),
                  const SizedBox(height: 10.0),
                  _fileUploadWidget(
                      title: "TM30",
                      formats: "${FileFormat.values.map((e) => e.name)}",
                      image: Image.asset(ImgConst.thaiImmigration),
                      onPressed: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _fileUploadWidget({
    required String title,
    required String formats,
    required Image image,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 150.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.mildGray),
          borderRadius: BorderRadius.circular(10.0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80.0,
            height: 80.0,
            child: Center(
              child: image,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(title).bodyLarge,
              const SizedBox(height: 10.0),
              TextButton(
                  style: TextButton.styleFrom(
                      foregroundColor: AppColor.white,
                      backgroundColor: AppColor.primaryColor),
                  onPressed: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text("Upload").bodyMedium,
                            const SizedBox(width: 10.0),
                            const Icon(Icons.upload_rounded)
                          ],
                        ),
                        Text(formats).bodySmall.white
                      ],
                    ),
                  ))
            ],
          )),
        ],
      ),
    );
  }
}
