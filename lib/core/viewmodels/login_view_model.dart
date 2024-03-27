import 'dart:async';
import 'package:global_services_mobile/core/enums/viewstate.dart';
import 'package:global_services_mobile/core/models/profile.dart';
import 'package:global_services_mobile/core/service/strava_service.dart';
import 'package:global_services_mobile/locator.dart';
import 'package:global_services_mobile/ui/utils/utils.dart';
import 'package:strava_client/strava_client.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final StravaService _stravaService = locator<StravaService>();

  Future<DetailedAthlete?> getAthlete() async {
    ViewState.Busy;
    var profile = await Utils.getSavedInfo();
    ViewState.Idle;
    return profile;
  }

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

  void deAuth() async {
    await _stravaService.deAuthorize();
  }
}
