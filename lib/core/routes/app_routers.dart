import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/features/splash/presentation/view/splash.dart';
import 'package:coffe_shop_app/features/home/view/home_screen_body.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/sign_in_view.dart';
import 'package:coffe_shop_app/features/home/view/home.dart';
import 'package:flutter/material.dart';

import '../../features/auth/presentation/views/sign_up_view.dart';

class AppRouters {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Splash());

      case Routing.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreenBody());

      case Routing.signInRouteName:
        return MaterialPageRoute(
          builder: (_) => const SignInView(),
        );
      case Routing.signUpRouteName:
        return MaterialPageRoute(
          builder: (_) => const SignUpView(),
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
