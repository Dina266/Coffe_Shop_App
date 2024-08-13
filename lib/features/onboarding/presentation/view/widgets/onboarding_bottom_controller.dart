import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/view/widgets/custom_onbarding_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingBottomController extends StatelessWidget {
  const OnboardingBottomController({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SmoothPageIndicator(
          controller: OnboardingCubit.of(context).pageController,
          count: OnboardingCubit.of(context).onboardingData.length,
          effect: const JumpingDotEffect(
            activeDotColor: AppColors.primaryColor,
          ),
        ),
        OnboardingCustomButton(
          onPressed: ()=> OnboardingCubit.of(context).nextPage(context),
        ),
      ],
    );
  }
}
