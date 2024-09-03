import 'package:coffe_shop_app/core/services/stripe_services.dart';
import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
import 'package:coffe_shop_app/features/details/data/repo/stripe_payment_repo.dart';
import 'package:dartz/dartz.dart';

class StripePaymentRepoImpl extends StripePaymentRepo {
  final StripeServices stripeServices ;

  StripePaymentRepoImpl({required this.stripeServices});
  @override
  Future<Either<String,void>>makePayment({required PaymentUserInput paymentUserInput})async {
    try {
      await stripeServices.makePayment(paymentUserInput: paymentUserInput);
      return right(null);
    } catch (e) {
      return left(e.toString());
    }
  }
}