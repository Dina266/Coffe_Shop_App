import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class ButtonBarIcons {
  static const ColorFilter _colorFilter = ColorFilter.mode(
    AppColors.iconsColor,
    BlendMode.srcIn,
  );

  static SvgPicture get unselectedHome => SvgPicture.asset(
        Assets.imagesHome,
      );
  static SvgPicture get selectedHome => SvgPicture.asset(
        Assets.imagesHome,
        colorFilter: _colorFilter,
      );

  static SvgPicture get unselectedGift => SvgPicture.asset(
        Assets.imagesGift,
      );

  static SvgPicture get selectedGift => SvgPicture.asset(
        Assets.imagesGift,
        colorFilter: _colorFilter,
      );
  // scan
  static SvgPicture get unselectedScan => SvgPicture.asset(
        Assets.imagesScan,
      );

  static SvgPicture get selectedScan => SvgPicture.asset(
        Assets.imagesScan,
        colorFilter: _colorFilter,
      );

  // order

  static SvgPicture get unselectedOrder => SvgPicture.asset(
        Assets.imagesOrder,
      );

  static SvgPicture get selectedOrder => SvgPicture.asset(
        Assets.imagesOrder,
        colorFilter: _colorFilter,
      );

  // account
  static SvgPicture get unselectedAccount => SvgPicture.asset(
        Assets.imagesAccount,
      );

  static SvgPicture get selectedAccount => SvgPicture.asset(
        Assets.imagesAccount,
        colorFilter: _colorFilter,
      );
}
