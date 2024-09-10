import 'package:coffee_corner/core/widgets/custom_button.dart';
import 'package:coffee_corner/features/auth/presentation/view_models/auth/auth_cubit.dart';
import 'package:coffee_corner/features/auth/presentation/views/widgets/custom_Text_field_form.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassViewBody extends StatefulWidget {
  const ForgetPassViewBody({super.key});

  @override
  State<ForgetPassViewBody> createState() => _ForgetPassViewBodyState();
}

class _ForgetPassViewBodyState extends State<ForgetPassViewBody> {
  GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: formkey,
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            CustomTextFieldForm(
              label: 'your email',
              hintText: 'Enter your email',
              onSaved: (value) {
                email = value!;
              },
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(
              title: 'Reset Password',
              onTap: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  context.read<AuthCubit>().resetPassword(email: email);
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
