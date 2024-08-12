import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/features/home/presentation/view/splash.dart';
import 'package:coffe_shop_app/features/home/view/home.dart';
import 'package:flutter/material.dart';
class AppRouters {
  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Splash());

      case Routing.home:
        return MaterialPageRoute(builder: (_) => const Home());

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