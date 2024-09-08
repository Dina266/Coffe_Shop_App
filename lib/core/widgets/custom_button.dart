import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.onTap});

  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppColors.primaryColor,
        ),
        child: Center(
          child: Text(
            title,
            style: AppStyle.medium14.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
