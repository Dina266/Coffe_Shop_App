import 'dart:developer';

import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/helpers/get_it_function.dart';
import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
import 'package:coffe_shop_app/features/details/presentation/controller/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:coffe_shop_app/features/details/presentation/controller/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quickalert/quickalert.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../home/data/models/coffe_model.dart';

class PaymentButton extends StatelessWidget {
  const PaymentButton({
    super.key,
    required this.coffeModel,
  });

  final CoffeModel coffeModel;

  @override
  Widget build(BuildContext context) {
    return BlocListener<StripePaymentCubit, StripePaymentState>(
      listener: (context, state) {
        if (state is StripePaymentSuccess) {
          QuickAlert.show(
            context: context,
            type: QuickAlertType.success,
            title: 'Success',
          );
        } else if (state is StripePaymentFailure) {
          log(state.error);
          QuickAlert.show(
            context: context,
            type: QuickAlertType.error,
            title: state.error,
          );
        }
      },
      child: ElevatedButton(
        onPressed: () {
          StripePaymentCubit.get(context).makePayment(
            paymentUserInput: PaymentUserInput(
              amount: coffeModel.price,
              currency: 'usd',
              customerId: getIt<CacheHelper>().getStripeUserId()!,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        child: Text(
          'Add to Cart \$ ${coffeModel.price}',
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
