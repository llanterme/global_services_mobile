import 'package:flutter/material.dart';
import 'package:global_services_mobile/core/models/activities_model.dart';
import 'package:global_services_mobile/core/models/activities_model.dart';
import 'package:global_services_mobile/ui/views/activitity_detail_view.dart';
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

      case 'activitydetail':
        var activitiesModel = settings.arguments as ActivitiesModel;
        return MaterialPageRoute(
            builder: (_) => ActivitiesDetailView(
                  activitiesModel: activitiesModel,
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
