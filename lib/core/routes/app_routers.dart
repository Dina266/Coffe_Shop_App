import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:flutter/material.dart';
import '../../features/Home/view/splash.dart';

class AppRouters {
  static Route generateRoute(RouteSettings settings) {

    switch (settings.name) {
      case Routing.init:
        return MaterialPageRoute(builder: (_) => const Splash());


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