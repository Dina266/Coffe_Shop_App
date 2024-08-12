import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ForgetPawssordWidget extends StatelessWidget {
  const ForgetPawssordWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Forgot password?',
          style: AppStyle.regular16.copyWith(
            color: AppColors.lightGreen,
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Text(
          ' Reset Here',
          style: AppStyle.medium16.copyWith(color: AppColors.primaryColor),
        ),
      ],
    );
  }
}
