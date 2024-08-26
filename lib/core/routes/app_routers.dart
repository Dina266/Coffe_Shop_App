import 'package:coffe_shop_app/core/helpers/get_it_function.dart';
import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/forget_pass_view.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo_impl.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_cubit.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:coffe_shop_app/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:coffe_shop_app/features/splash/presentation/view/splash.dart';
import 'package:coffe_shop_app/features/home/presentation/view/home_screen_body.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/sign_up_view.dart';

class AppRouters {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Splash());

      case Routing.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) =>
                CofeeCubit(homeRepoImpl: getIt<HomeRepoImpl>())..getCoffee(),
            child: const HomeScreenBody(),
          ),
        );

      case Routing.signInRouteName:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
        );
      case Routing.signUpRouteName:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
        );

      case Routing.onboarding:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => OnboardingCubit(),
            child: const OnboardingView(),
          ),
        );
      case Routing.forgetPass:
        return MaterialPageRoute(
          builder: (_) => ForgetPassView(),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
