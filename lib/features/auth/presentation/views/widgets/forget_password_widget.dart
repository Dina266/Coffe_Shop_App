import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routes/routing.dart';

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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, Routing.forgetPass);
          },
          child: Text(
            ' Reset Here',
            style: AppStyle.medium16.copyWith(color: AppColors.primaryColor),
          ),
        ),
      ],
    );
  }
}
