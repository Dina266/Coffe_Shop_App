import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
import 'package:dartz/dartz.dart';

abstract class StripePaymentRepo {
  Future<Either<String,void>> makePayment({required PaymentUserInput paymentUserInput});
}