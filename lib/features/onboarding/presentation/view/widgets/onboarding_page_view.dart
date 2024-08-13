import 'package:coffe_shop_app/core/utils/app_styles.dart';

import 'package:coffe_shop_app/features/onboarding/presentation/controller/onboarding_cubit/onboarding_cubit.dart';

import 'package:flutter/material.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: OnboardingCubit.of(context).pageController,
        itemCount:OnboardingCubit.of(context).onboardingData.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Image.asset(
                OnboardingCubit.of(context).onboardingData[index]['image']!,
                height: 255,
                width: 255,
              ),
              const SizedBox(height: 100),
              Text(
                OnboardingCubit.of(context).onboardingData[index]['title']!,
                style: AppStyle.bold28,
              ),
              const SizedBox(height: 16),
              Text(
                OnboardingCubit.of(context).onboardingData[index]['description']!,
                style: AppStyle.medium16,
              ),
            ],
          );
        },
      ),
    );
  }
}
