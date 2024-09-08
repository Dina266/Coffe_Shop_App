import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/features/auth/domain/repos/auth_repo.dart';
import 'package:coffee_corner/features/auth/presentation/view_models/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/sign_in_bloc_consumer_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<AuthRepo>(),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.authBackgroundColor,
          body: SignInBlocConsumerBody(),
        ),
      ),
    );
  }
}
