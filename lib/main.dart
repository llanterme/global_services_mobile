import 'package:flutter/material.dart';

import 'app_router.dart';
import 'locator.dart';
import 'style.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Global Services',
      theme: _theme(),
      initialRoute: 'login',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

ThemeData _theme() {
  return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.purple,
        brightness: Brightness.dark,
      ),
      textTheme: const TextTheme(
        bodyMedium: Styles.bodyMedium,
      ),
      useMaterial3: true,
      appBarTheme: Styles.appBarTheme);
}
