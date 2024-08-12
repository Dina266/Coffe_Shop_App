
import 'package:flutter/material.dart';

import '../../../core/utils/app_styles.dart';
import 'custom_category_grid_item.dart';
import 'custom_shimmer_placholder.dart';

class CustomCategoryGrid extends StatelessWidget {
  final bool isLoading;
  final String title;

  const CustomCategoryGrid({super.key, this.isLoading = true, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: AppStyle.bold28,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'See all',
                  style: TextStyle(fontSize: 18, color: Color(0xff4E8D7C)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 200, 
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(), 
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: List.generate(3, (index) {
                if (isLoading) {
                  return const ShimmerPlaceholder();
                } else {
                  return CustomCategoryGridItem(
                    image: 'assets/images/app_icon_small.svg',
                    label: 'card ${index + 1}',
                  );
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
