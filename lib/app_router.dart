import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/views/home_view.dart';
import 'package:global_services_mobile/ui/views/landing_view.dart';
import 'package:global_services_mobile/ui/views/activity_detail_view.dart';
import 'package:global_services_mobile/ui/views/register_view.dart';
import 'ui/views/login_view.dart';

const String initialRoute = "login";

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomeView());

      case 'register':
        return MaterialPageRoute(builder: (_) => RegisterView());

      case 'login':
        return MaterialPageRoute(builder: (_) => LoginView());

      case 'activity-detail':
        var summaryActivityId = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => ActivityDetailView(
                  summaryActivityId: summaryActivityId,
                ));

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
