import 'package:coffe_shop_app/core/utils/app_styles.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/widgets/sign_in_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInViewBody extends StatelessWidget {
  const SignInViewBody({super.key});

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
                    Spacer(),
                    SvgPicture.asset(
                      Assets.imagesAppIconSmall,
                      height: 89,
                      width: 56,
                    ),
                    Spacer(),
                    Text(
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
        SliverFillRemaining(
          hasScrollBody: false,
          child: SignInForm(),
        ),
      ],
    );
  }
}
