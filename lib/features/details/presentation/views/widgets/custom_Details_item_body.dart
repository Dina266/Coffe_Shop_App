import 'package:coffe_shop_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_styles.dart';
import '../../../../home/data/models/coffe_model.dart';
import 'custom_buttons.dart';
import 'custom_drop_down_menu.dart';
import 'custom_incremental_widget.dart';

class CustomDetailsItem extends StatefulWidget {
  final CoffeModel coffeeModel;

  const CustomDetailsItem({super.key, required this.coffeeModel});
  @override
  State<CustomDetailsItem> createState() => _CustomDetailsItemState();
}

class _CustomDetailsItemState extends State<CustomDetailsItem> {
  String cupSize = S.current.cupSizeLarge;
  String addIns = S.current.addInsNormalIce;
  String creamer = S.current.creamerOatmilk;
  int sweetenerCount = 0;
  int flavorCount = 0;

  List<String> cupSizes = [
    S.current.cupSizeSmall,
    S.current.cupSizeLarge,
    S.current.cupSizeMedium
  ];
  List<String> addInses = [
    S.current.addInsNormalIce,
    S.current.addInsMoreIce,
    S.current.addInsLessIce
  ];
  List<String> creamers = [
    S.current.creamerOatmilk,
    S.current.creamerCaramel,
    S.current.creamerVanilla
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            S.of(context).whats_included,
            style: AppStyle.bold18,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            S.of(context).cupSize,
            style: AppStyle.bold16,
          ),
        ),
        CustomDropDownMenu(items: cupSizes, val: cupSize),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            S.of(context).addIns,
            style: AppStyle.bold16,
          ),
        ),
        CustomDropDownMenu(items: addInses, val: addIns),
        const SizedBox(
          height: 24,
        ),
        CustomIncrementalItems(
            title: S.of(context).sweetener,
            subTitle: S.of(context).sweetener_subtitle),
        const SizedBox(
          height: 24,
        ),
        CustomIncrementalItems(
            title: S.of(context).flavor, subTitle: S.of(context).flavorSubtitle),
        const SizedBox(
          height: 24,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 26.0, right: 20, bottom: 15),
          child: Text(
            S.of(context).creamer,
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
