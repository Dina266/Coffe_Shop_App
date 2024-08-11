
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_styles.dart';

class CustomCategoryGridItem extends StatelessWidget {
  final String image;
  final String label;

  const CustomCategoryGridItem({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
              child: SvgPicture.asset(image , height: 80,),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                label,
                style: AppStyle.bold16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
