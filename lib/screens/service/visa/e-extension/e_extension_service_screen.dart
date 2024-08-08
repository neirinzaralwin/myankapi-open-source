import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/img_const.dart';
import 'package:myankapi/core/enum/file_format_enum.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/widgets/appbar/custom_appbar.dart';
import 'package:myankapi/screens/widgets/buttons/back_button.dart';

class EextensionServiceScreen extends StatefulWidget {
  const EextensionServiceScreen({super.key});

  @override
  State<EextensionServiceScreen> createState() =>
      _EextensionServiceScreenState();
}

class _EextensionServiceScreenState extends State<EextensionServiceScreen> {
  final cardPadding = 10.0;
  File? bioPageFile;
  File? tm30File;

  bool get checkCanSubmit => bioPageFile != null && tm30File != null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBackgroundColor,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
        child: Column(
          children: [
            if (kIsWeb) const SizedBox(height: 10.0),
            Row(
              children: [
                const BackButtonWidget(),
                const SizedBox(width: 15.0),
                const Text('E-extension Service').headLarge.bold.primaryColor,
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(cardPadding),
              decoration: BoxDecoration(
                color: AppColor.veryMildGreen,
                borderRadius: BorderRadius.circular(10.0 + cardPadding),
                border: Border.all(color: AppColor.secondaryColor),
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
                      onPicked: (pickedFile) {}),
                  const SizedBox(height: 10.0),
                  _fileUploadWidget(
                      title: "TM30",
                      formats: "${FileFormat.values.map((e) => e.name)}",
                      onPicked: (pickedFile) {}),
                  const SizedBox(height: 50.0),
                  IgnorePointer(
                    ignoring: !checkCanSubmit,
                    child: SizedBox(
                      height: 55.0,
                      width: double.maxFinite,
                      child: FilledButton(
                          style: FilledButton.styleFrom(
                              backgroundColor: checkCanSubmit
                                  ? AppColor.primaryColor
                                  : AppColor.mildGray),
                          onPressed: () {},
                          child: const Text("Submit").bodyMedium),
                    ),
                  ),
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
    required Function(dynamic) onPicked,
  }) {
    return Container(
      height: 120.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: AppColor.white,
          border: Border.all(color: AppColor.mildGray),
          borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("No file chosen").bodyMedium.greyColor,
          const SizedBox(height: 10.0),
          Row(
            children: [
              SizedBox(
                  width: 160.0, child: Center(child: Text(title).bodyLarge)),
              Expanded(
                child: TextButton(
                    style: TextButton.styleFrom(
                        foregroundColor: AppColor.white,
                        backgroundColor: AppColor.secondaryColor),
                    onPressed: () {},
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
                    )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
