import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../../../core/helpers/show_message_snack.dart';
import '../../view_models/auth/auth_cubit.dart';

class SignInBlocConsumerBody extends StatelessWidget {
  const SignInBlocConsumerBody({
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
      },
      builder: (context, state) {
        return ModalProgressHUD(
          progressIndicator: const CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
          inAsyncCall: state is AuthLoading,
          child: const SignInViewBody(),
        );
      },
    );
  }
}
