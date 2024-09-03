part of 'detail_cubit.dart';

@immutable
sealed class DetailState {}

final class DetailInitial extends DetailState {}

final class DetailLoadingState extends DetailState {}

final class DetailLoadedState extends DetailState {
  final CoffeModel coffeModel;

  DetailLoadedState({required this.coffeModel});
}

final class DetailFailureState extends DetailState {
  final String eMessage;

  DetailFailureState({required this.eMessage});
}
