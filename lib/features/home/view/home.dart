import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          'assets/images/unselected_gift.svg',
          colorFilter:const ColorFilter.mode(
            Color(0xff007AFF),
            BlendMode.srcIn,
             
          ),
        ),
      ),
    );
  }
}
