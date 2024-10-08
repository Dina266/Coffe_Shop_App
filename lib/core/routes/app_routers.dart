import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:coffee_corner/core/routes/routing.dart';
import 'package:coffee_corner/features/auth/presentation/views/forget_pass_view.dart';
import 'package:coffee_corner/features/details/data/repo/stripe_payment_repo.dart';
import 'package:coffee_corner/features/details/presentation/controller/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:coffee_corner/features/details/presentation/views/details_screen.dart';
import 'package:coffee_corner/features/home/data/repo/home_repo_impl.dart';
import 'package:coffee_corner/features/home/presentation/controller/coffe_cubit/cofee_cubit.dart';
import 'package:coffee_corner/features/onboarding/presentation/controller/onboarding_cubit/onboarding_cubit.dart';
import 'package:coffee_corner/features/onboarding/presentation/view/onboarding_view.dart';
import 'package:coffee_corner/features/splash/presentation/view/splash.dart';
import 'package:coffee_corner/features/home/presentation/view/home_screen_body.dart';
import 'package:coffee_corner/features/auth/presentation/views/sign_in_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/details/data/repo/detail_repo_impl.dart';
import '../../features/details/presentation/controller/detail_cubit/detail_cubit.dart';

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
          builder: (_) => const ForgetPassView(),
        );
      case Routing.detailsScreen:
        final coffeeID = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) =>
                          DetailCubit(detailRepoImpl: getIt<DetailRepoImpl>())
                            ..getCoffeeItem(coffeeID: coffeeID),
                    ),
                    BlocProvider(
                      create: (context) => StripePaymentCubit(
                        getIt<StripePaymentRepo>(),
                      ),
                    ),
                  ],
                  child: const DetailsScreen(),
                ));
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
