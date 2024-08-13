import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/helpers/extentions.dart';
import 'package:coffe_shop_app/core/helpers/get_it_function.dart';
import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/app_styles.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/view/widgets/onboarding_bottom_controller.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/view/widgets/onboarding_page_view.dart';
import 'package:coffe_shop_app/generated/l10n.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/cache_keys.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.authBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: TextButton(
                  onPressed: () {
                    context.pushReplacementNamed(Routing.signInRouteName);
                    getIt<CacheHelper>().saveData(key: CacheKeys.onboardingKey, value: true);
                  },
                  child: Text(
                    S.of(context).skip,
                    style: AppStyle.medium14,
                  ),
                ),
              ),
              const SizedBox(height: 80),
              const OnboardingPageView(),
              const OnboardingBottomController(),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
