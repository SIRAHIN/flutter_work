import 'package:flutter/material.dart';

import 'routes/routes_manager.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RoutesManager.routeConfig,
      // routeInformationParser: RoutesManager.routeConfig.routeInformationParser,
      // routeInformationProvider: RoutesManager.routeConfig.routeInformationProvider,
      // routerDelegate: RoutesManager.routeConfig.routerDelegate,

    );
  }
}