import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
import 'package:coffe_shop_app/features/details/presentation/controller/stripe_payment_cubit/stripe_payment_cubit.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../home/data/models/coffe_model.dart';

class CustomButtons extends StatelessWidget {
  final CoffeModel coffeModel;

  const CustomButtons({super.key, required this.coffeModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
          onPressed: () {
            StripePaymentCubit.get(context).makePayment(
              paymentUserInput:
                  PaymentUserInput(amount: coffeModel.price, currency: 'usd'),
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
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          ),
          label: const Text(
            'Cancel',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
