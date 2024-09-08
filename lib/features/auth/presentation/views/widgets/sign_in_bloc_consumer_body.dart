import 'package:coffee_corner/core/routes/routing.dart';
import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        if (state is AuthSuccess) {
          if (FirebaseAuth.instance.currentUser!.emailVerified) {
            Navigator.pushReplacementNamed(context, Routing.homeScreen);
          } else {
            showMessageSnack(context, 'this email is not verified');
          }
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
