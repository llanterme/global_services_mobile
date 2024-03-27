// ignore_for_file: avoid_print

import 'dart:async';
import 'package:global_services_mobile/core/service/strava_service.dart';
import 'package:strava_client/strava_client.dart';
import '../../locator.dart';
import 'base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  final StravaService _stravaService = locator<StravaService>();
  String? errorMessage;

  Future<TokenResponse> authStrava() async {
    var token = await _stravaService.authenticate(
      [
        AuthenticationScope.profile_read_all,
        AuthenticationScope.read_all,
        AuthenticationScope.activity_read_all
      ],
      "stravaflutter://redirect",
    );

    return token;
  }
}
