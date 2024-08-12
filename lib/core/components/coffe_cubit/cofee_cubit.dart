import 'package:bloc/bloc.dart';
import 'package:coffe_shop_app/core/components/models/coffe_model.dart';
import 'package:coffe_shop_app/core/components/services/cofee_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

part 'cofee_state.dart';

class CofeeCubit extends Cubit<CofeeState> {
  CofeeCubit() : super(CofeeInitial());

  late List<CoffeModel> coffeeModel;

  getCoffee () async{
    try {
      coffeeModel = await CoffeService(Dio()).getAllCoffe();
      emit(CofeeLoadedState(coffeeModel: coffeeModel));
    } catch (e) {
      emit(CofeeFailureState());
    }
  }
}
