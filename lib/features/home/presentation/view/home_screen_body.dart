import 'dart:developer';

import 'package:coffe_shop_app/features/home/data/models/coffe_model.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_cubit.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_state.dart';
import 'package:coffe_shop_app/features/home/presentation/view/widget/custom_shimmer_placholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/custom_app_bar.dart';
import 'widget/custom_category_grid.dart';
import 'widget/custom_drawer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CofeeCubit, CofeeState>(builder: (context, state) {
      if (state is CofeeFailureState) {
        return Scaffold(
          body: Center(
            child: Text(state.eMessage),
          ),
        );
      } else if (state is CofeeLoadedState) {
        log('iam body');

        return HomeScreenBodyItem(
          coddfeModel: state.coffeeModel,
        );
      } else {
        log('iam loading');
        return const ShimmerPlaceholder();
      }
    });
  }
}

class HomeScreenBodyItem extends StatelessWidget {
  const HomeScreenBodyItem({super.key, required this.coddfeModel});
  final List<CoffeModel> coddfeModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F2ED),
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: CustomCategoryGrid(
        isLoading: false,
        title: "Drinks",
        coffeModel: coddfeModel,
      ),
    );
  }
}
