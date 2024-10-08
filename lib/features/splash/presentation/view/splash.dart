import 'package:coffee_corner/core/cache/cache_helper.dart';
import 'package:coffee_corner/core/cache/cache_keys.dart';
import 'package:coffee_corner/core/helpers/extentions.dart';
import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:coffee_corner/core/routes/routing.dart';
import 'package:coffee_corner/core/utils/assets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      handleNavigation();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            Assets.imagesSplashBackground,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Center(
            child: SvgPicture.asset(Assets.imagesAppIcon),
          ),
        ],
      ),
    );
  }

  void handleNavigation() {
    if (FirebaseAuth.instance.currentUser != null) {
      context.pushReplacementNamed(Routing.homeScreen);
    } else if (getIt<CacheHelper>().getData(key: CacheKeys.onboardingKey) ==
        true) {
      context.pushReplacementNamed(Routing.signInRouteName);
    } else {
      context.pushReplacementNamed(Routing.onboarding);
    }
  }
}
