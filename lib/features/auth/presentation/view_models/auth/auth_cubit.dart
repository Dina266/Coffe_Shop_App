import 'package:bloc/bloc.dart';
import 'package:coffe_shop_app/features/auth/domain/entits/user_entity.dart';
import 'package:coffe_shop_app/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(
      AuthLoading(),
    );
    var response = await authRepo.loginWithEmailAndPassWord(
      email: email,
      password: password,
    );
    response.fold(
      (failure) {
        emit(
          AuthFailure(errorMessage: failure.errorMessage),
        );
      },
      (user) {
        emit(
          AuthSuccess(user: user),
        );
      },
    );
  }

  Future<void> createUserWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    emit(
      AuthLoading(),
    );
    var response = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    response.fold(
      (failure) {
        emit(
          AuthFailure(errorMessage: failure.errorMessage),
        );
      },
      (user) {
        emit(
          AuthSuccess(user: user),
        );
      },
    );
  }
}
