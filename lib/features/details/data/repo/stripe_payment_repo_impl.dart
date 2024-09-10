import 'package:coffee_corner/core/services/stripe_services.dart';
import 'package:coffee_corner/features/details/data/models/payment_user_input.dart';
import 'package:coffee_corner/features/details/data/repo/stripe_payment_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripePaymentRepoImpl extends StripePaymentRepo {
  final StripeServices stripeServices;

  StripePaymentRepoImpl({required this.stripeServices});
  @override
  Future<Either<String, void>> makePayment(
      {required PaymentUserInput paymentUserInput}) async {
    try {
      await stripeServices.makePayment(paymentUserInput: paymentUserInput);
      return right(null);
    } on StripeException catch (e) {
      if (e.error.code == FailureCode.Canceled) {
        return left('The operation was canceled.');
      } else if (e.error.code == FailureCode.Failed) {
        return left(
            'The payment attempt failed. Please check your payment details or try again.');
      } else if (e.error.code == FailureCode.Timeout) {
        return left(
            'The payment request timed out. Please check your network and try again.');
      } else if (e.error.code == FailureCode.Unknown) {
        return left('An unknown error occurred. Please try again later.');
      } else {
        return left('An error occurred. Please try again.');
      }
    } catch (e) {
      return left(e.toString());
    }
  }
}
