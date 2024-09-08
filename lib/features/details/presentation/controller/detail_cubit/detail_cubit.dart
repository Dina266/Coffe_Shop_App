import 'package:bloc/bloc.dart';
import 'package:coffee_corner/features/details/data/repo/detail_repo_impl.dart';
import 'package:coffee_corner/features/home/data/models/coffe_model.dart';
import 'package:meta/meta.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState> {
  DetailCubit({required this.detailRepoImpl}) : super(DetailInitial());
  final DetailRepoImpl detailRepoImpl;

  late CoffeModel coffeeModel;

  void getCoffeeItem({required int coffeeID}) async {
    emit(DetailLoadingState());
    final result = await detailRepoImpl.getCoffeItem(coffeeId: coffeeID);
    result.fold(
      (failureMessage) => emit(
        DetailFailureState(eMessage: failureMessage),
      ),
      (coffeModelList) {
        coffeeModel = coffeModelList;

        emit(
          DetailLoadedState(
            coffeModel: coffeModelList,
          ),
        );
      },
    );
  }
}
