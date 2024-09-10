import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/show_message_snack.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../view_models/auth/auth_cubit.dart';
import 'sign_up_view_body.dart';

class signUpBlocConsumerBody extends StatelessWidget {
  const signUpBlocConsumerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          showMessageSnack(
            context,
            state.errorMessage,
          );
        }
        if (state is AuthSuccess) {
          showMessageSnack(context, 'send link to verfiy your email');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          inAsyncCall: state is AuthLoading,
          child: const SignUpViewBody(),
        );
      },
    );
  }
}
