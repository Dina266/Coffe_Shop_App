import 'dart:developer';

import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/helpers/get_it_function.dart';
import 'package:coffe_shop_app/core/services/api_services.dart';
import 'package:coffe_shop_app/core/services/database_service.dart';
import 'package:coffe_shop_app/core/services/firebase_auth_service.dart';
import 'package:coffe_shop_app/features/auth/domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/utils/backend_points.dart';
import '../../domain/entits/user_entity.dart';
import '../models/user_model.dart';

class AuthRepoImpl implements AuthRepo {
  AuthRepoImpl(
      {required this.databaseService, required this.firebaseAuthService});

  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;

  @override
  Future<Either<Failure, UserEntity>> loginWithEmailAndPassWord({
    required String email,
    required String password,
  }) async {
    var response = await firebaseAuthService.loginWithEmailAndPassWord(
      email: email,
      password: password,
    );
    var stripeId = await _createUserStripeId(email: email);
  await getIt<CacheHelper>().saveStripeUserId(stripeId: stripeId);
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
      (user) async {
        await firebaseAuthService.emailVerification();
        await addUser(
          userEntity: UserEntity(
            name: name,
            email: email,
            userId: user.uid,
          ),
        );

        return right(UserModel.fromfirbase(user));
      },
    );
  }

  @override
  Future<void> resetPassword({required String email}) async {
    await firebaseAuthService.resetPassword(email: email);
  }

  @override
  Future addUser({required UserEntity userEntity}) async {
    try {
      await databaseService.addData(
        path: BackendPoints.addUser,
        data: userEntity.toMap(),
        documentId: userEntity.userId,
      );
    } on Exception catch (e) {
      print(e);
      firebaseAuthService.deleteUser();
    }
  }

  Future _createUserStripeId({String? name, String? email}) async {
    try {
      var response = await getIt<ApiServices>().post(
        body: {
          if (email != null) 'email': email,
          if (name != null) 'name': name,
        },
        contentType: 'application/x-www-form-urlencoded',
        url: 'https://api.stripe.com/v1/customers',
        token: dotenv.env['SECRET_KEY']!,
      );
      log('StripeId: ${response.data['id']}');
      return response.data['id'];
    } catch (e) {
      log(e.toString());
    }
  }
}
