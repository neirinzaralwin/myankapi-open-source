import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/controllers/services/visa/visa_cubit.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeServiceWidget extends StatefulWidget {
  const HomeServiceWidget({super.key});

  @override
  State<HomeServiceWidget> createState() => _HomeServiceWidgetState();
}

class _HomeServiceWidgetState extends State<HomeServiceWidget> {
  final visaCubit = VisaCubit();

  @override
  void initState() {
    visaCubit.getHomeServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VisaCubit>(
      create: (context) => visaCubit,
      child: Padding(
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
                  BlocBuilder<VisaCubit, VisaState>(
                      bloc: visaCubit,
                      builder: (context, state) {
                        if (state is HomeVisaLoading) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[200]!,
                            highlightColor: AppColor.white,
                            child: Container(
                              height: 200.0,
                              margin: const EdgeInsets.all(15.0),
                              decoration: BoxDecoration(
                                color: AppColor.black,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        }
                        if (state is HomeVisaSuccess) {
                          return Column(
                            children:
                                List.generate(state.services.length, (index) {
                              return ListTile(
                                onTap: () => [],
                                title: Text(state.services[index].name)
                                    .bodyMedium
                                    .bold,
                                subtitle:
                                    Text(state.services[index].visaDuration)
                                        .bodyMedium
                                        .greyColor,
                                trailing: const Icon(Icons.arrow_right_alt),
                              );
                            }),
                          );
                        }
                        if (state is HomeVisaFailure) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(state.message).bodyMedium.redColor,
                            ),
                          );
                        }
                        return const SizedBox();
                      }),

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
      ),
    );
  }
}
