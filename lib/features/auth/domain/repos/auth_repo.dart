import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entits/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassWord({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });

  Future<void> resetPassword({required String email});
}
