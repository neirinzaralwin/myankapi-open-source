import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/home/home_screen.dart';

class HomeServiceWidget extends StatefulWidget {
  const HomeServiceWidget({super.key});

  @override
  State<HomeServiceWidget> createState() => _HomeServiceWidgetState();
}

class _HomeServiceWidgetState extends State<HomeServiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text("Visa services").bold.headLarge.greyColor,
          const SizedBox(height: 10.0),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: AppColor.primaryColor),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  onTap: () => AppPages.router.goNamed(Routes.eExtension),
                  title: const Text("E-extension service").bold,
                  subtitle: const Text("1 month").greyColor,
                  trailing: const Icon(Icons.arrow_right_alt),
                ),
                ListTile(
                  onTap: () => [],
                  title: const Text("TR-extension service").bold,
                  subtitle: const Text("1 month").greyColor,
                  trailing: const Icon(Icons.arrow_right_alt),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: const Text("Admin's choice").bold.headSmall,
                ),
                const SizedBox(height: 10.0),
                // round profile and name
                SizedBox(
                  height: 88.0,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 2,
                        itemBuilder: (context, index) => Column(
                              children: [
                                const CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage: NetworkImage(
                                      "https://img.freepik.com/free-photo/portrait-friendly-looking-happy-attractive-male-model-with-moustache-beard-wearing-trendy-transparent-glasses-smiling-broadly-while-listening-interesting-story-waiting-mom-give-meal_176420-22400.jpg"),
                                ),
                                const SizedBox(height: 2.0),
                                SizedBox(
                                    width: 100.0,
                                    child: const Text(
                                      "Person name",
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ).bodySmall),
                              ],
                            )),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
