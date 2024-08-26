
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_styles.dart';
import 'custom_quantity_counter.dart';

class CustomIncrementalItems extends StatelessWidget {
  final String subTitle;

  final String title;

  const CustomIncrementalItems(
      {super.key, required this.subTitle, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: AppStyle.bold16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subTitle,
                  style: AppStyle.semiBold16,
                ),
                
                QuantityCounter(),
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
