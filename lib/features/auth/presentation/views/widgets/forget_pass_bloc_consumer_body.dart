import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/show_message_snack.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../view_models/auth/auth_cubit.dart';
import 'forget_pass_view_body.dart';

class ForgetPassBlocConsumerBody extends StatelessWidget {
  const ForgetPassBlocConsumerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuceessResetPassword) {
          showMessageSnack(context, 'send email reset to your email');
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is AuthLoading,
          progressIndicator: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          child: Scaffold(
            backgroundColor: AppColors.authBackgroundColor,
            appBar: AppBar(
              backgroundColor: AppColors.authBackgroundColor,
              centerTitle: true,
              title: Text(
                'Forget Password',
                style: AppStyle.bold20.copyWith(color: AppColors.primaryColor),
              ),
            ),
            body: ForgetPassViewBody(),
          ),
        );
      },
    );
  }
}
