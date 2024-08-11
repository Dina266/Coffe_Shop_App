import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatefulWidget {
  const CustomTextFieldForm(
      {super.key,
      required this.label,
      required this.hintText,
      this.suffixIcon});
  final String label;
  final String hintText;
  final IconData? suffixIcon;

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  bool isSecure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: AppStyle.regular16.copyWith(
            color: AppColors.lightGreen,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'field required';
              }
              return null;
            },
            obscureText: widget.suffixIcon != null ? isSecure : false,
            decoration: InputDecoration(
              fillColor: Colors.white,
              suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            isSecure = !isSecure;
                          });
                        },
                        icon: Icon(
                          widget.suffixIcon,
                        ),
                        color: Colors.black,
                      ),
                    )
                  : SizedBox(),
              filled: true,
              enabledBorder: buildTextFormBorder(Colors.white),
              focusedBorder: buildTextFormBorder(AppColors.primaryColor),
              errorBorder: buildTextFormBorder(AppColors.primaryColor),
              focusedErrorBorder: buildTextFormBorder(AppColors.primaryColor),
              hintText: widget.hintText,
              hintStyle: AppStyle.regular16.copyWith(
                color: Color(0xff989898),
              ),
            ),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder buildTextFormBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide(color: color),
    );
  }
}
