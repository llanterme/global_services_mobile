import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/views/home_view.dart';
import 'package:global_services_mobile/ui/views/profile_list_view.dart';
import 'package:global_services_mobile/ui/views/profile_view.dart';
import 'core/models/user.dart';
import 'ui/views/landing_view.dart';
import 'ui/views/login_view.dart';
import 'ui/views/register_view.dart';

const String initialRoute = "login";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case 'profile-list':
        return MaterialPageRoute(builder: (_) => ProfileListView());
      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());
      case 'profile':
        return MaterialPageRoute(builder: (_) => ProfileView());
      case 'register':
        return MaterialPageRoute(builder: (_) => RegisterView());
      case 'landing':
        return MaterialPageRoute(builder: (_) => LandingView());

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
