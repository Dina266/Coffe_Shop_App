import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomDropDownMenu extends StatefulWidget {
  CustomDropDownMenu({super.key, required this.items, required this.val});
  final List<String> items;
  String val;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 60,
          color: Colors.white,
          child: DropdownButton<String>(
            value: widget.val,
            onChanged: (newValue) {
              setState(() {
                widget.val = newValue!;
              });
            },
            items: widget.items.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            isExpanded: true,
            icon: const Icon(Icons.arrow_drop_down_circle,
                color: AppColors.primaryColor),
          ),
        ));
  }
}
