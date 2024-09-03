import 'package:coffe_shop_app/features/details/presentation/controller/detail_cubit/detail_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'detail_screen_body_item.dart';

class DetailsScreenBody extends StatelessWidget {
  const DetailsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DetailCubit, DetailState>(builder: (context, state) {
      if (state is DetailFailureState) {
        return Scaffold(
          body: Center(
            child: Text(state.eMessage),
          ),
        );
      } else if (state is DetailLoadedState) {
        return DetailScreenBodyItem(
          coffeeModel: state.coffeModel,
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
