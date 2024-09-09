class PaymentUserInput {
  final String amount;
  final String currency;
  final String customerId;
  PaymentUserInput(
      {required this.amount, required this.currency, required this.customerId});

  toJson() {
    return {
      'amount': (double.parse(amount) * 100).round(),
      'currency': currency,
      'customer': customerId,
    };
  }
}
