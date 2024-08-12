import 'package:coffe_shop_app/core/utils/app_colors.dart';
import 'package:coffe_shop_app/core/utils/app_styles.dart';
import 'package:coffe_shop_app/core/utils/assets.dart';
import 'package:coffe_shop_app/core/utils/widgets/custom_button.dart';
import 'package:coffe_shop_app/features/auth/presentation/view_models/auth/auth_cubit.dart';
import 'package:coffe_shop_app/features/auth/presentation/views/widgets/custom_Text_field_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String userName, email, password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                ],
                color: Color(0xffFAFAFA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  topRight: Radius.circular(34),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                'Sign Up',
                                style: AppStyle.bold28.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                              ),
                              Spacer(),
                              SvgPicture.asset(
                                Assets.imagesFaceIDSymbol,
                                height: 40,
                                width: 40,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'We are so excited you’re ready to become apart of our coffee network! don’t forget  check out your perks!',
                            style: AppStyle.regular14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextFieldForm(
                      onSaved: (value) {
                        setState(() {
                          userName = value!;
                        });
                      },
                      label: 'Username',
                      hintText: 'Enter username',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldForm(
                      onSaved: (value) {
                        setState(() {
                          email = value!;
                        });
                      },
                      label: 'Email or phone number',
                      hintText: 'Type your email or phone number',
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomTextFieldForm(
                      onSaved: (value) {
                        setState(() {
                          password = value!;
                        });
                      },
                      label: 'Password',
                      hintText: 'Type your password',
                      suffixIcon: Icons.remove_red_eye_outlined,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      title: 'REGISTER',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          context
                              .read<AuthCubit>()
                              .createUserWithEmailAndPassword(
                                email: email,
                                password: password,
                                name: userName,
                              );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        child: Center(
                          child: Text(
                            'Already have an account?',
                            style: AppStyle.regular14.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                        title: 'SIGN IN', onTap: () => Navigator.pop(context)),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
