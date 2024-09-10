import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helpers/get_it_function.dart';
import '../../domain/repos/auth_repo.dart';
import '../view_models/auth/auth_cubit.dart';
import 'widgets/forget_pass_bloc_consumer_body.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(
        getIt.get<AuthRepo>(),
      ),
      child: ForgetPassBlocConsumerBody(),
    );
  }
}
