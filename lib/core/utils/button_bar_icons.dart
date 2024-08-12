import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

abstract class ButtonBarIcons {
  static const ColorFilter _colorFilter = ColorFilter.mode(
    AppColors.iconsColor,
    BlendMode.srcIn,
  );

  static SvgPicture _getIcon(String assetName, {bool isSelected = false}) {
    return SvgPicture.asset(
      assetName,
      colorFilter: isSelected ? _colorFilter : null,
    );
  }

  static SvgPicture get unselectedHome => _getIcon(Assets.imagesHome);
  static SvgPicture get selectedHome => _getIcon(Assets.imagesHome, isSelected: true);

  static SvgPicture get unselectedGift => _getIcon(Assets.imagesGift);
  static SvgPicture get selectedGift => _getIcon(Assets.imagesGift, isSelected: true);

  static SvgPicture get unselectedScan => _getIcon(Assets.imagesScan);
  static SvgPicture get selectedScan => _getIcon(Assets.imagesScan, isSelected: true);

  static SvgPicture get unselectedOrder => _getIcon(Assets.imagesOrder);
  static SvgPicture get selectedOrder => _getIcon(Assets.imagesOrder, isSelected: true);

  static SvgPicture get unselectedAccount => _getIcon(Assets.imagesAccount);
  static SvgPicture get selectedAccount => _getIcon(Assets.imagesAccount, isSelected: true);
}
