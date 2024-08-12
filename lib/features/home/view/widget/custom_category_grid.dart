import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/components/coffe_cubit/cofee_cubit.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_category_grid_item.dart';

class CustomCategoryGrid extends StatelessWidget {
  final bool isLoading;
  final String title;

  const CustomCategoryGrid(
      {super.key, this.isLoading = true, required this.title});

  @override
  Widget build(BuildContext context) {
    var coffeModel = BlocProvider.of<CofeeCubit>(context).coffeeModel;
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
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 16.0,
              ),
              itemCount:
                  coffeModel.length,
              itemBuilder: (context, index) {
                return CustomCategoryGridItem(
                  image: coffeModel[index].imageUrl,
                  label: coffeModel[index].name,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
