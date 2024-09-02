import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/services/api_services.dart';
import 'package:coffe_shop_app/core/services/firebase_auth_service.dart';
import 'package:coffe_shop_app/core/services/stripe_services.dart';
import 'package:coffe_shop_app/features/details/data/repo/stripe_payment_repo.dart';
import 'package:coffe_shop_app/features/details/data/repo/stripe_payment_repo_impl.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/details/data/repo/detail_repo_impl.dart';

final getIt = GetIt.asNewInstance();

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
    ),
  );
  getIt.registerLazySingleton(() => CacheHelper());

  getIt.registerLazySingleton(() => Dio());
  getIt.registerLazySingleton(() => HomeRepoImpl(dio: getIt<Dio>()));
  getIt.registerLazySingleton(() => DetailRepoImpl(dio: getIt<Dio>()));
  getIt.registerLazySingleton(() => ApiServices(dio: getIt<Dio>()));
  getIt.registerLazySingleton(
      () => StripeServices(apiServices: getIt<ApiServices>()));
  getIt.registerLazySingleton<StripePaymentRepo>(
      () => StripePaymentRepoImpl(stripeServices: getIt<StripeServices>()));

  getIt.registerLazySingleton(() => Logger());
}
