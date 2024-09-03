import 'package:coffe_shop_app/features/details/data/models/payment_user_input.dart';
import 'package:coffe_shop_app/features/details/data/repo/stripe_payment_repo.dart';
import 'package:coffe_shop_app/features/details/presentation/controller/stripe_payment_cubit/stripe_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StripePaymentCubit extends Cubit<StripePaymentState> {
  StripePaymentCubit(this.stripePaymentRepo) : super(StripePaymentInitial());
  final StripePaymentRepo stripePaymentRepo;
  static StripePaymentCubit get(context) => BlocProvider.of(context);

  Future<void> makePayment({required PaymentUserInput paymentUserInput}) async {
    emit(StripePaymentLoading());
    final result =
        await stripePaymentRepo.makePayment(paymentUserInput: paymentUserInput);

    result.fold(
      (failure) {
        emit(StripePaymentFailure(failure));
      },
      (success) {
        emit(StripePaymentSuccess());
      },
    );
  }
}
