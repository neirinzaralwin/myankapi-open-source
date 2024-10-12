import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_color.dart';
import 'package:myankapi/constants/app_font.dart';

enum Menu { settings, contact_us, about, logout }

class PopUpMenuWidget extends StatelessWidget {
  const PopUpMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      padding: const EdgeInsets.all(3.0),
      icon: Row(
        children: [
          Container(
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
          const Icon(Icons.arrow_drop_down, color: AppColor.darkGray),
        ],
      ),
      onSelected: (Menu item) {},
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
        PopupMenuItem<Menu>(
          value: Menu.settings,
          child: ListTile(
            leading: const Icon(CupertinoIcons.settings),
            title: const Text('Settings').bodyMedium,
          ),
        ),
        PopupMenuItem<Menu>(
          value: Menu.contact_us,
          child: ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Contact us').bodyMedium,
          ),
        ),
        PopupMenuItem<Menu>(
          value: Menu.about,
          child: ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About').bodyMedium,
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem<Menu>(
          value: Menu.logout,
          child: ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout').bodyMedium,
          ),
        ),
      ],
    );
  }
}
