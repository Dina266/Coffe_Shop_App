import 'package:coffe_shop_app/core/routes/routing.dart';
import 'package:flutter/material.dart';
import '../../../../../core/helpers/extentions.dart';
import '../../../../../core/utils/app_styles.dart';

class CustomCategoryGridItem extends StatelessWidget {
  final String image;
  final String label;
  final int id;

  const CustomCategoryGridItem(
      {super.key, required this.image, required this.label, required this.id});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routing.detailsScreen, argument: id);
      },
      child: SizedBox(
        width: 150,
        height: 400,
        child: Card(
          color: Colors.white,
          elevation: 0.2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(
                  image,
                  height: 80,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: AppStyle.bold16,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
