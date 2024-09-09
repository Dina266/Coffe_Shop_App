
import 'package:coffee_corner/generated/l10n.dart';

import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/data/models/coffe_model.dart';
import 'custom_buttons.dart';
import 'custom_drop_down_menu.dart';
import 'custom_incremental_widget.dart';
import 'package:coffe_shop_app/generated/l10n.dart';

class CustomDetailsItem extends StatefulWidget {
  final CoffeModel coffeeModel;

  const CustomDetailsItem({super.key, required this.coffeeModel});
  @override
  State<CustomDetailsItem> createState() => _CustomDetailsItemState();
}

class _CustomDetailsItemState extends State<CustomDetailsItem> {
  String cupSize = 'Large';
  String addIns = 'Normal Ice';
  String creamer = 'Oatmilk';
  int sweetenerCount = 0;
  int flavorCount = 0;

  List<String> cupSizes = ['Small', 'Medium', 'Large'];
  List<String> addInses = ['Normal Ice', 'more Ice', 'Less Ice'];
  List<String> creamers = ['Oatmilk', 'Carameil', 'Vanilla'];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.all(18.0),
          child: Text(
            "What's included",
            style: AppStyle.bold18,
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            'Cup Size',
            style: AppStyle.bold16,
          ),
        ),
        CustomDropDownMenu(items: cupSizes, val: cupSize),
        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            'Add-Ins',
            style: AppStyle.bold16,
          ),
        ),
        CustomDropDownMenu(items: addInses, val: addIns),
        const SizedBox(
          height: 24,
        ),
        const CustomIncrementalItems(
            title: "Sweetener", subTitle: "Splenda® packet"),
        const SizedBox(
          height: 24,
        ),

        CustomIncrementalItems(
            title: S.of(context).flavor, subTitle: S.of(context).flavorSubtitle),

        const SizedBox(
          height: 24,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            'Creamer',
            style: AppStyle.bold16,
          ),
        ),
        CustomDropDownMenu(items: creamers, val: creamer),
        const SizedBox(
          height: 24,
        ),
        CustomButtons(
          coffeModel: widget.coffeeModel,
        )
      ],
    );
  }
}
