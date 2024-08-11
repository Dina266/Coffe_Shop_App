import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/features/home/view/home.dart';
import 'package:coffe_shop_app/features/home/view/home_screen_body.dart';
import 'package:flutter/material.dart';
class AppRouters {
  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Home());

      case Routing.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreenBody());


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