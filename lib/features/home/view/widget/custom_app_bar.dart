import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'custom_image_with_badge.dart';

customAppBar() {
  return AppBar(
    elevation: 1.0,
    title: SvgPicture.asset(
      'assets/images/app_icon_small.svg',
      height: 50,
    ),
    centerTitle: true,
    backgroundColor: const Color(0xfff6f2ed),
    leading: Builder(
      builder: (context) => IconButton(
        icon: SvgPicture.asset(
          'assets/images/menu.svg',
        ),
        iconSize: 40,
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
      ),
    ),
    actions: const [
      Padding(
        padding: EdgeInsets.only(right: 16.0),
        child: ImageWithBadge(),
      ),
    ],
  );
}
