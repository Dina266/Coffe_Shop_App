import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/features/home/view/home.dart';
import 'package:flutter/material.dart';
class AppRouters {
  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Home());
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