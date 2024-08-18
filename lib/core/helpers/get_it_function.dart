import 'package:coffe_shop_app/core/cache/cache_helper.dart';
import 'package:coffe_shop_app/core/services/firebase_auth_service.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo.dart';
import 'package:coffe_shop_app/features/home/data/repo/home_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/data/repos/auth_repo_impl.dart';
import '../../features/auth/domain/repos/auth_repo.dart';

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
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(dio: getIt<Dio>()));

  
  
}
