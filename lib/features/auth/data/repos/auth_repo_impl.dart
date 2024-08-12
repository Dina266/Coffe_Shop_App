import 'package:coffe_shop_app/core/services/firebase_auth_service.dart';
import 'package:coffe_shop_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/utils/errors/failure.dart';
import '../../domain/entits/user_entity.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl({required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassWord({
    required String email,
    required String password,
  }) async {
    var response = await firebaseAuthService.loginWithEmailAndPassWord(
      email: email,
      password: password,
    );
    return response.fold(
      (failure) => left(failure),
      (user) => right(
        UserModel.fromfirbase(user),
      ),
    );
  }

  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    var response = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email, password: password);

    return response.fold(
      (failure) => left(failure),
      (user) => right(
        UserModel.fromfirbase(user),
      ),
    );
  }
}
