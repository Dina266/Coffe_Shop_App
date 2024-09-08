import 'package:coffee_corner/core/utils/app_styles.dart';
import 'package:coffee_corner/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'sign_up_form.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  right: 16,
                  left: 16,
                  top: 20,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SvgPicture.asset(
                      Assets.imagesAppIconSmall,
                      height: 89,
                      width: 56,
                    ),
                    const Spacer(),
                    const Text(
                      'Skip',
                      style: AppStyle.medium14,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          hasScrollBody: false,
          child: SignUpForm(),
        ),
      ],
    );
  }
}
