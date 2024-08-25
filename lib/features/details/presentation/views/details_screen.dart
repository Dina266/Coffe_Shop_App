import 'package:coffe_shop_app/features/home/presentation/view/widget/custom_drawer.dart';
import 'package:flutter/material.dart';
import '../../../home/presentation/view/widget/custom_app_bar.dart';
import 'widgets/details_screen_body.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: const DetailsScreenBody(),
    );
  }
}

