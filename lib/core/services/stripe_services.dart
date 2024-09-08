import 'dart:developer';

import 'package:coffee_corner/core/services/api_services.dart';
import 'package:coffee_corner/features/details/data/models/create_payment_intent/create_payment_intent.dart';
import 'package:coffee_corner/features/details/data/models/payment_user_input.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  final ApiServices apiServices;

  StripeServices({required this.apiServices});

  Future<CreatePaymentIntent> createPaymentIntent(
      {required PaymentUserInput paymentUserInput}) async {
    final paymentIntent = await apiServices.post(
      body: paymentUserInput.toJson(),
      url: 'https://api.stripe.com/v1/payment_intents',
      contentType: 'application/x-www-form-urlencoded',
      token: dotenv.env['SECRET_KEY']!,
    );
    log('PaymentIntent: ${paymentIntent.statusCode}');

    return CreatePaymentIntent.fromJson(paymentIntent.data);
  }

  Future<void> initPaymentSheet(
      {required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Khaled Elalfy',
        paymentIntentClientSecret: paymentIntentClientSecret,
        // Customer keys
        // customerEphemeralKeySecret: data['ephemeralKey'],
        // customerId: data['customer'],
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void>makePayment({required PaymentUserInput paymentUserInput}) async{
    final paymentIntent = await createPaymentIntent(paymentUserInput: paymentUserInput);
    await initPaymentSheet(paymentIntentClientSecret: paymentIntent.clientSecret!);
    await displayPaymentSheet();
  
  }
}
