import 'package:coffee_corner/core/cache/cache_helper.dart';
import 'package:coffee_corner/core/helpers/extentions.dart';
import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:coffee_corner/core/routes/routing.dart';
import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/core/utils/app_styles.dart';
import 'package:coffee_corner/features/onboarding/presentation/view/widgets/onboarding_bottom_controller.dart';
import 'package:coffee_corner/features/onboarding/presentation/view/widgets/onboarding_page_view.dart';
import 'package:coffee_corner/generated/l10n.dart';
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
                  onPressed: () async {
                    await getIt<CacheHelper>()
                        .saveData(key: CacheKeys.onboardingKey, value: true);
                    if (context.mounted) {
                      context.pushReplacementNamed(Routing.signInRouteName);
                    }
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
