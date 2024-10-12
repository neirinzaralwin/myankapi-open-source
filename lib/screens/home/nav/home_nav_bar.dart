import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_const.dart';
import 'package:myankapi/constants/app_font.dart';
import 'package:myankapi/constants/app_pages.dart';
import 'package:myankapi/constants/routes.dart';
import 'package:myankapi/screens/home/home_screen.dart';
import 'package:myankapi/screens/home/nav/pop_up_menu_widget.dart';
import 'package:myankapi/utils/screen_dimension.dart';

class HomeNavBar extends StatefulWidget {
  final StatefulNavigationShell navigationShell;
  final Function(String) onChanged;
  final Function(bool) onSearchingChanged;

  const HomeNavBar({
    super.key,
    required this.navigationShell,
    required this.onChanged,
    required this.onSearchingChanged,
  });

  @override
  State<HomeNavBar> createState() => _HomeNavBarState();
}

class _HomeNavBarState extends State<HomeNavBar> {
  List<Widget> items = [];
  bool _isSearching = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  void _setSearching(bool value) {
    setState(() {
      _isSearching = value;
    });
    widget.onSearchingChanged(value);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 65.0,
        color: Colors.grey[200],
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(opacity: animation, child: child);
          },
          child: _isSearching
              ? Padding(
                  padding: EdgeInsets.symmetric(horizontal: HomeScreen.homePadding),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildSearchField(),
                      TextButton(
                          onPressed: () {
                            _setSearching(false);
                          },
                          child: const Text("Cancel").bodyMedium.primaryColor),
                    ],
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildAppName(),
                    if (!ScreenDimension.isMobileView(context)) _buildSearchField(),
                    _buildActions(),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return Flexible(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400.0, minWidth: 200.0),
        child: TextField(
          key: ValueKey<bool>(_isSearching),
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Search products...',
            prefixIcon: const Icon(CupertinoIcons.search, color: AppColor.primaryColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: BorderSide.none,
            ),
            hintStyle: const TextStyle(fontSize: 14.0, color: AppColor.darkGray),
            filled: true,
            fillColor: AppColor.mildGray,
            contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          ),
          onChanged: (value) => widget.onChanged(value),
          onTap: () {
            widget.onSearchingChanged(true);
          },
          onTapOutside: (event) {
            _setSearching(false);
          },
          onSubmitted: (value) {
            _setSearching(false);
          },
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
        child: Text(
                ScreenDimension.isMobileView(context) ? AppConst.APP_NAME_SHORT : AppConst.APP_NAME)
            .bold
            .headMedium,
      ),
    );
  }

  Widget _buildActions() {
    return Row(
      children: [
        const SizedBox(width: 10.0),
        if (ScreenDimension.isMobileView(context)) const SizedBox(width: 10.0),
        if (ScreenDimension.isMobileView(context)) _buildSearchIcon(),
        const SizedBox(width: 10.0),
        _buildShoppingBagIcon(),
        const SizedBox(width: 10.0),
        const PopUpMenuWidget(),
        SizedBox(width: HomeScreen.homePadding),
      ],
    );
  }

  Widget _buildSearchIcon() {
    return IconButton(
      key: ValueKey<bool>(_isSearching),
      onPressed: () {
        _setSearching(true);
        // Request focus after the state has been updated
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _focusNode.requestFocus();
        });
      },
      icon: const Icon(
        CupertinoIcons.search,
        color: AppColor.primaryColor,
      ),
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
}
