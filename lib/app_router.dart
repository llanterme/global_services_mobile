import 'package:flutter/material.dart';

import 'core/models/user.dart';
import 'ui/views/chat_view.dart';
import 'ui/views/landing_view.dart';
import 'ui/views/login_view.dart';
import 'ui/views/register_view.dart';

const String initialRoute = "login";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'chat':
        return MaterialPageRoute(builder: (_) => ChatView());
      case 'register':
        return MaterialPageRoute(builder: (_) => RegisterView());
      case 'landing':
        var user = settings.arguments as User;
        return MaterialPageRoute(
            builder: (_) => LandingView(
                  user: user,
                ));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No route defined for ${settings.name}'),
                  ),
                ));
    }
  }
}
