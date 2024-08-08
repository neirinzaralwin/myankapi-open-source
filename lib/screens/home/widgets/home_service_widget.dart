import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/controllers/service/service_cubit.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:shimmer/shimmer.dart';

class HomeServiceWidget extends StatefulWidget {
  const HomeServiceWidget({super.key});

  static final serviceCubit = ServiceCubit();
  @override
  State<HomeServiceWidget> createState() => _HomeServiceWidgetState();
}

class _HomeServiceWidgetState extends State<HomeServiceWidget> {
  @override
  void initState() {
    HomeServiceWidget.serviceCubit.getHomeServices();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double cardPadding = 10.0;

    return BlocProvider<ServiceCubit>(
      create: (context) => HomeServiceWidget.serviceCubit,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text("Services").bold.headLarge.greyColor,
            const SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0 + cardPadding),
                border: Border.all(color: AppColor.primaryColor),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ServiceCubit, ServiceState>(
                      bloc: HomeServiceWidget.serviceCubit,
                      builder: (context, state) {
                        if (state is ServiceLoading) {
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
                        if (state is ServiceSuccess) {
                          return Column(children: [
                            ...List.generate(state.services.length, (index) {
                              final service = state.services[index];

                              return Container(
                                margin: const EdgeInsets.all(cardPadding),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: AppColor.mildGreen, width: 1.0),
                                    borderRadius: BorderRadius.circular(10.0)),
                                child: ListTile(
                                  onTap: () =>
                                      AppPages.router.goNamed(service.route),
                                  title: Text(state.services[index].name)
                                      .bodyMedium
                                      .bold,
                                  trailing: const Icon(Icons.arrow_right_alt),
                                ),
                              );
                            }),
                            TextButton(
                                onPressed: () {},
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("View more")
                                        .bodyMedium
                                        .primaryColor,
                                    const SizedBox(width: 10.0),
                                    const Icon(Icons.arrow_right_alt,
                                        color: AppColor.primaryColor)
                                  ],
                                )),
                            const SizedBox(height: 10.0)
                          ]);
                        }
                        if (state is ServiceFailure) {
                          return SizedBox(
                            height: 200,
                            child: Center(
                              child: Text(state.message).bodyMedium.redColor,
                            ),
                          );
                        }
                        return const SizedBox();
                      }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
