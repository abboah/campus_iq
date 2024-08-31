import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:campus_iq/core/widgets/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../../core/widgets/drawer.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification';
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;

    return Scaffold(
        // endDrawer: Drawer(
        //     width: MediaQuery.of(context).size.width / 1.5,
        //     child: const MainDrawer()),
        bottomNavigationBar: const BottomNavBarFb2(),
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
          backgroundColor: ExtraColors.transparent,
          actions: const [
            // IconButton(
            //   padding: const EdgeInsets.only(right: 20.0),
            //   hoverColor: ExtraColors.transparent,
            //   highlightColor: ExtraColors.transparent,
            //   onPressed: () {
            //     scaffoldKey.currentState!.openEndDrawer();
            //   },
            //   icon: Icon(IconlyLight.category,
            //       color: isLightTheme ? ExtraColors.black : ExtraColors.white),
            // ),
          ],
        ),
        // key: scaffoldKey,
        body: Container());
  }
}
