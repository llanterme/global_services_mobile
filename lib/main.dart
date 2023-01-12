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
      initialRoute: 'chat',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}

ThemeData _theme() {
  return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: Styles.appBarTextStyle,
          ),
          color: Styles.appBarColor),
      scaffoldBackgroundColor: Styles.bodyColor);
}
