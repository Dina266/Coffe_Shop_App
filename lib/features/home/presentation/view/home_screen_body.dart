import 'dart:developer';

import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_cubit.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_state.dart';
import 'package:coffe_shop_app/features/home/presentation/view/widget/custom_shimmer_placholder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'widget/custom_app_bar.dart';
import 'widget/custom_category_grid.dart';
import 'widget/custom_drawer.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<CofeeCubit>().getCoffee();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CofeeCubit, CofeeState>(builder: (context, state) {
      if (state is CofeeInitial) {
        log('iam loading');
        return const ShimmerPlaceholder();
      } else if (state is CofeeLoadedState) {
        log('iam body');

        return const HomeScreenBodyItem();
      } else {
        return const Text('oops there was an error');
      }
    });
  }
}

class HomeScreenBodyItem extends StatelessWidget {
  const HomeScreenBodyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF6F2ED),
        appBar: customAppBar(),
        drawer: const CustomDrawer(),
        body: const CustomCategoryGrid(isLoading: false, title: "Drinks"));
  }
}
