import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/data/nav/model/home_nav_model.dart';
import 'package:myankapi/screens/home/nav/pop_up_menu_widget.dart';
import 'home_nav_item.dart';

class HomeNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  const HomeNavBar({super.key, required this.navigationShell});

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  List<Widget> items = [];

  @override
  void initState() {
    super.initState();
    addItemsToList();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 65.0,
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAppName(),
            _buildActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildAppName() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 50.0, bottom: 5.0),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () => AppPages.router.goNamed(Routes.home),
        child: const Text(AppConst.APP_NAME).bold.headMedium,
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        const SizedBox(width: 10.0),
        const PopUpMenuWidget(),
        const SizedBox(width: 10.0),
        _buildShoppingBagIcon(),
        _buildProfileImage(),
      ],
    );
  }

  Widget _buildShoppingBagIcon() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.shopping_bag_outlined,
        color: AppColor.primaryColor,
      ),
    );
  }

  Widget _buildProfileImage() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          border: Border.all(color: AppColor.primaryColor, width: 1.5),
          borderRadius: BorderRadius.circular(50.0),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.0),
          child: Image.network(
            "https://static.vecteezy.com/system/resources/thumbnails/005/544/718/small_2x/profile-icon-design-free-vector.jpg",
            width: 35.0,
            height: 35.0,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void addItemsToList() {
    items = [
      HomeNavigationItem(
        navigationShell: widget.navigationShell,
        model: const HomeNavModel(
          title: "Home",
          route: Routes.home,
          icon: Icons.home,
          branchIndex: 0,
        ),
      ),
    ];
  }
}
