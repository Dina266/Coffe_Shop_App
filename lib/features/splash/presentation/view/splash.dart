import 'package:coffe_shop_app/core/helpers/extentions.dart';
import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
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
          Image.asset(Assets.imagesSplashBackground),
          Align(
            alignment: Alignment.center,
            child: SvgPicture.asset(Assets.imagesAppIcon),
          ),
        ],
      ),
    );
  }

  void handleNavigation() {
    context.pushReplacementNamed(Routing.onboarding);
  }
}
