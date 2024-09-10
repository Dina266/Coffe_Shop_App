import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../../generated/l10n.dart';

class OnboardingCustomButton extends StatelessWidget {
  const OnboardingCustomButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(150, 60),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        S.of(context).next,
        style: AppStyle.medium14.copyWith(color: AppColors.white),
      ),
    );
  }
}
