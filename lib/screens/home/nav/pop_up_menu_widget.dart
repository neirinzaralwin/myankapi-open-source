import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myankapi/constants/app_font.dart';

enum Menu { settings, contact_us, about, logout }

class PopUpMenuWidget extends StatelessWidget {
  const PopUpMenuWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<Menu>(
      icon: const Icon(Icons.more_vert),
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
