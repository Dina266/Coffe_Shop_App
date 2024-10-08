import 'package:coffee_corner/core/cache/cache_helper.dart';
import 'package:coffee_corner/core/helpers/bloc_observer.dart';
import 'package:coffee_corner/core/helpers/get_it_function.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'core/routes/app_routers.dart';
import 'core/routes/routing.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setUpGetIt();
  getIt<CacheHelper>().init();
  Bloc.observer = MyBlocObserver();
  await dotenv.load(fileName: ".env");
  
  Stripe.publishableKey = dotenv.env['PUBLISHABLE_KEY']!;
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: Routing.init,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
