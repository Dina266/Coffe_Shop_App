import 'package:flutter/material.dart';
import '../widget/custom_app_bar.dart';
import '../widget/custom_category_grid.dart';
import '../widget/custom_drawer.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F2ED),
      appBar: customAppBar(),
      drawer: const CustomDrawer(),
      body: ListView(
        children: const [
          CustomCategoryGrid(isLoading: false, title: "Drinks"),
          CustomCategoryGrid(isLoading: false, title: "Food"),
          CustomCategoryGrid(isLoading: false, title: "At Home Coffee"),
          CustomCategoryGrid(isLoading: false, title: "Merchandise"),
        ],
      ),
    );
  }
}
