import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/features/home/presentation/view/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/view/widget/custom_app_bar.dart';
import 'widgets/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: const DetailsScreenBody(),
    );
  }
}
