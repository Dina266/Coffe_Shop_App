
import 'package:coffee_corner/core/cache/cache_helper.dart';
import 'package:coffee_corner/core/services/api_services.dart';
import 'package:coffee_corner/core/services/firebase_auth_service.dart';
import 'package:coffee_corner/core/services/stripe_services.dart';
import 'package:coffee_corner/features/details/data/repo/stripe_payment_repo.dart';
import 'package:coffee_corner/features/details/data/repo/stripe_payment_repo_impl.dart';
import 'package:coffee_corner/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';
import '../../features/details/data/repo/detail_repo_impl.dart';
import '../services/database_service.dart';
import '../services/firebase_store_service.dart';

final getIt = GetIt.asNewInstance();

void setUpGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(
    FirebaseAuthService(),
  );
  getIt.registerSingleton<DatabaseService>(
    FirebaseStoreService(),
  );
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuthService: getIt.get<FirebaseAuthService>(),
      databaseService: getIt.get<DatabaseService>(),
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
