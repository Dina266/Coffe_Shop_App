import 'dart:developer';

import 'package:coffe_shop_app/core/services/api_services.dart';
import 'package:coffe_shop_app/features/details/data/models/create_payment_intent/create_payment_intent.dart';
import 'package:coffe_shop_app/features/details/data/models/ephmweal_key_model/ephmeral_key_model.dart';
import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
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
      {required String paymentIntentClientSecret,
      required String ephemeralKey,
      required String customerId}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Khaled Elalfy',
        paymentIntentClientSecret: paymentIntentClientSecret,
        // Customer keys
        customerEphemeralKeySecret: ephemeralKey,
        customerId: customerId,
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<EphemeralKeyModel> getEphemeralKey(
      {required String customerId}) async {
    var response = await apiServices.post(
      body: {
        'customer': customerId,
      },
      url: 'https://api.stripe.com/v1/ephemeral_keys',
      contentType: 'application/x-www-form-urlencoded',
      headers: {
        'Stripe-Version': '2023-08-16',
        'Authorization': 'Bearer ${dotenv.env['SECRET_KEY']!}'
      },
      token: dotenv.env['SECRET_KEY']!,
    );
    log(response.data['secret']);
    return EphemeralKeyModel.fromJson(response.data);
  }

  Future<void> makePayment({required PaymentUserInput paymentUserInput}) async {
    final paymentIntent =
        await createPaymentIntent(paymentUserInput: paymentUserInput);
    final ephemeralKey =
        await getEphemeralKey(customerId: paymentUserInput.customerId);

    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntent.clientSecret!,
      ephemeralKey: ephemeralKey.secret!,
      customerId: paymentUserInput.customerId,
    );
    await displayPaymentSheet();
  }
}
