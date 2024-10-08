import 'package:coffee_corner/core/routes/routing.dart';
import 'package:coffee_corner/core/utils/app_colors.dart';
import 'package:coffee_corner/core/utils/app_styles.dart';
import 'package:coffee_corner/core/utils/assets.dart';
import 'package:coffee_corner/core/widgets/custom_button.dart';
import 'package:coffee_corner/features/auth/presentation/view_models/auth/auth_cubit.dart';
import 'package:coffee_corner/features/auth/presentation/views/widgets/custom_Text_field_form.dart';
import 'package:coffee_corner/features/auth/presentation/views/widgets/forget_password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    super.key,
  });

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email, password;
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
                                'Sign In',
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
                            'It’s coffee time! Login and lets get all the coffee in the world! Or at least iced coffee. ',
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
                        suffixIcon: Icons.remove_red_eye),
                    SizedBox(
                      height: 30,
                    ),
                    CustomButton(
                      title: 'LOGIN',
                      onTap: () {
                        if (formkey.currentState!.validate()) {
                          formkey.currentState!.save();
                          context.read<AuthCubit>().loginWithEmailAndPassword(
                                email: email,
                                password: password,
                              );
                        } else {
                          autovalidateMode = AutovalidateMode.always;
                        }
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 20,
                      ),
                    ),
                    ForgetPawssordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Don’t have an account?',
                      style: AppStyle.regular14.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    CustomButton(
                      title: 'CREATE NEW ACCOUNT',
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routing.signUpRouteName,
                      ),
                    ),
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
