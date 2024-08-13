import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/cache/cache_keys.dart';
import 'package:coffe_shop_app/core/helpers/extentions.dart';
import 'package:coffe_shop_app/core/helpers/get_it_function.dart';
import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/controller/onboarding_cubit/onboarding_state.dart';
import 'package:coffe_shop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  static OnboardingCubit of(context) => BlocProvider.of(context);
  PageController pageController = PageController();

  List<Map<String, String>> onboardingData = [
    {
      'title': S.current.onboardingOneTitle,
      'image': Assets.imagesOnboardingOne,
      'description': S.current.onboardingOneDesc
    },
    {
      'title': S.current.onboardingTwoTitle,
      'image': Assets.imagesOnboardingTwo,
      'description': S.current.onboardingTwoDesc
    },
    {
      'title': S.current.onboardingThreeTitle,
      'image': Assets.imagesOnboardingThree,
      'description': S.current.onboardingThreeDesc
    },
  ];

  void nextPage(BuildContext context) async {
    if (pageController.page!.toInt() == onboardingData.length - 1) {
      await getIt<CacheHelper>()
          .saveData(key: CacheKeys.onboardingKey, value: true);
      if (context.mounted) {
        context.pushReplacementNamed(Routing.signInRouteName);
      }
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
