import 'package:campus_iq/core/themes/extra_colors.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class BottomNavBarFb2 extends StatelessWidget {
  const BottomNavBarFb2({super.key});

  final primaryColor = const Color(0xff4338CA);
  final secondaryColor = const Color(0xff6D28D9);
  final accentColor = const Color(0xffffffff);
  final backgroundColor = const Color(0xffffffff);
  final errorColor = const Color(0xffEF4444);

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return BottomAppBar(
      color: isLightTheme ? ExtraColors.white : ExtraColors.black,
      child: SizedBox(
        height: 56,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconBottomBar(
                  text: "Home",
                  icon: IconlyBold.home,
                  selected: true,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Search",
                  icon: IconlyBold.search,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "AI Chat",
                  icon: IconlyBold.graph,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Settings",
                  icon: IconlyBold.setting,
                  selected: false,
                  onPressed: () {}),
              IconBottomBar(
                  text: "Profile",
                  icon: IconlyBold.profile,
                  selected: false,
                  onPressed: () {})
            ],
          ),
        ),
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {super.key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed});
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final primaryColor = const Color(0xff4338CA);

  @override
  Widget build(BuildContext context) {
    final bool isLightTheme = Theme.of(context).brightness == Brightness.light;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon,
              size: 25,
              color: selected
                  ? primaryColor
                  : isLightTheme
                      ? ExtraColors.black.withOpacity(0.8)
                      : ExtraColors.white),
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: .1,
              color: selected
                  ? primaryColor
                  : isLightTheme
                      ? ExtraColors.black.withOpacity(0.8)
                      : ExtraColors.white),
        )
      ],
    );
  }
}
