class PaymentUserInput {
  final String amount;
  final String currency;

  PaymentUserInput({required this.amount, required this.currency});

  toJson() {
    return {
      'amount':(double.parse(amount)*100).round(),
      'currency': currency,
    };
  }

  
}
