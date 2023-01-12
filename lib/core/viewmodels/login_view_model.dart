import 'dart:async';

import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/user.dart';
import '../network/api.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  String errorMessage;
  final Api _api = locator<Api>();

  Future<User> loginFacebook() async {
    bool isLoggedIn = await checkFacebookLogin();

    if (!isLoggedIn) {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);

      switch (result.status) {
        case LoginStatus.success:
          final userData = await FacebookAuth.instance.getUserData();
          User user = User();
          user.emailAddress = userData["email"];
          user.name = userData["name"];
          user.imageUrl = userData["picture"]["data"]["url"];
          return user;
          break;
        case LoginStatus.cancelled:
          errorMessage = "You cancelled the login request to facebook.";
          setState(ViewState.Idle);
          return null;
          break;
        case LoginStatus.failed:
          errorMessage = "A error has occured. Please try again.";
          setState(ViewState.Idle);
          return null;
          break;
      }
    }
  }

  Future<bool> checkFacebookLogin() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }
}
