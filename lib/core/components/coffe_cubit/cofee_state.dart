part of 'cofee_cubit.dart';

@immutable
sealed class CofeeState {}

final class CofeeInitial extends CofeeState {}
final class CofeeLoadedState extends CofeeState{
  final List<CoffeModel> coffeeModel;

  CofeeLoadedState({required this.coffeeModel});
}

final class CofeeFailureState extends CofeeState {}

