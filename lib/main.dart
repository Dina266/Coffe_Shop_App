import 'package:flutter/material.dart';

import 'core/routes/app_routers.dart';
import 'core/routes/routing.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routing.init,
      onGenerateRoute: AppRouters.generateRoute,
    );
  }
}
