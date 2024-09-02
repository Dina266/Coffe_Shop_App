import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import '../../../../home/data/models/coffe_model.dart';
import 'custom_Details_item_body.dart';

class DetailScreenBodyItem extends StatelessWidget {
  const DetailScreenBodyItem({super.key, required this.coffeeModel});
  final CoffeModel coffeeModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.lightGreen,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Image.network(coffeeModel.imageUrl, height: 100),
              const SizedBox(width: 8),
              Text(
                coffeeModel.name,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
        Expanded(child: CustomDetailsItem(coffeeModel: coffeeModel)),
        const SizedBox(height: 16),
      ],
    );
  }
}
