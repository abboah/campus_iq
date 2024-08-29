import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      '',
      'Personal Schedule',
      'AI Chat',
      'Settings',
      'Logout'
    ];
    List<IconData> icons = [
      IconlyLight.category,
      IconlyLight.time_circle,
      IconlyLight.chat,
      IconlyLight.setting,
      IconlyLight.logout,
    ];
    return ListView(
      children: <Widget>[
        ListTile(
          trailing: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(IconlyLight.category)),
        ),
        ListTile(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(IconlyLight.home)),
          title: const Text('Home'),
        ),
        ListTile(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(IconlyLight.time_circle)),
          title: const Text('Personal Schedule'),
        ),
        ListTile(
          leading:
              IconButton(onPressed: () {}, icon: const Icon(IconlyLight.chat)),
          title: const Text('AI Chat'),
        ),
        ListTile(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(IconlyLight.location)),
          title: const Text('Navigator'),
        ),
        ListTile(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(IconlyLight.setting)),
          title: const Text('Settings'),
        ),
        ListTile(
          leading: IconButton(
              onPressed: () {}, icon: const Icon(IconlyLight.logout)),
          title: const Text('Logout'),
        ),
      ],
    );
  }
}
