import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/views/display_image_view.dart';
import 'package:global_services_mobile/ui/views/landing_view.dart';
import 'package:global_services_mobile/ui/views/take_photo_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'takephoto':
        return MaterialPageRoute(builder: (_) => TakePhotoView());

      case 'displayphoto':
        var imagePath = settings.arguments as String;
        return MaterialPageRoute(
            builder: (_) => DisplayImageView(
                  imagePath: imagePath,
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
