import 'package:coffe_shop_app/features/home/data/models/coffe_model.dart';

sealed class CofeeState {}

final class CofeeInitial extends CofeeState {}

final class CofeeLoadingState extends CofeeState {}

final class CofeeLoadedState extends CofeeState {
  final List<CoffeModel> coffeeModel;

  CofeeLoadedState({required this.coffeeModel});
}

final class CofeeFailureState extends CofeeState {
  final String eMessage;

  CofeeFailureState({required this.eMessage});
}
