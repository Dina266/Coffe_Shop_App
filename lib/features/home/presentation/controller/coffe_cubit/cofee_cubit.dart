import 'package:coffe_shop_app/features/home/data/models/coffe_model.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo_impl.dart';
import 'package:coffe_shop_app/features/home/presentation/controller/coffe_cubit/cofee_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CofeeCubit extends Cubit<CofeeState> {
  CofeeCubit({required this.homeRepoImpl}) : super(CofeeInitial());
  final HomeRepoImpl homeRepoImpl;
  late List<CoffeModel> coffeeModel;

  void getCoffee() async {
    emit(CofeeLoadingState());
    final result = await homeRepoImpl.getCoffeList();
    result.fold(
      (failureMessage) => emit(
        CofeeFailureState(eMessage: failureMessage),
      ),
      (coffeModelList) {
        coffeeModel = coffeModelList;

        emit(
          CofeeLoadedState(
            coffeeModel: coffeModelList,
          ),
        );
      },
    );
  }
}
