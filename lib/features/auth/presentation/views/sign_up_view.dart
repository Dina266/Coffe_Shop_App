import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.authBackgroundColor,
        body: SignUpViewBody(),
      ),
    );
  }
}
