import 'dart:async';
import 'dart:convert';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:global_services_mobile/core/enums/social_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';
import '../enums/viewstate.dart';
import '../models/user.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  String? errorMessage;

  User? savedUser;

  Future<User?> loginFacebook() async {
    bool isLoggedIn = await checkFacebookLogin();
    User user = User();

    if (isLoggedIn) {
      final LoginResult result = await FacebookAuth.instance
          .login(permissions: ["public_profile", "email"]);

      switch (result.status) {
        case LoginStatus.success:
          final userData = await FacebookAuth.instance.getUserData();

          print("userData:::: ${prettyPrint(userData)}");

          user.emailAddress = userData["email"];
          user.name = userData["name"];
          user.imageUrl = userData["picture"]["data"]["url"];
          user.socialNetwork = SocialNetwork.FaceBook;
          saveLocalUser(user);
          break;
        case LoginStatus.cancelled:
          errorMessage = "You cancelled the login request to facebook.";
          setState(ViewState.Idle);
          break;
        case LoginStatus.failed:
          errorMessage = "A error has occured. Please try again.";
          setState(ViewState.Idle);
          break;
        case LoginStatus.operationInProgress:
          break;
      }
    } else {
      final userData = await FacebookAuth.instance.getUserData();
      user.emailAddress = userData["email"];
      user.name = userData["name"];
      user.imageUrl = userData["picture"]["data"]["url"];
      user.socialNetwork = SocialNetwork.FaceBook;
      user.imageUrl = null;
      saveLocalUser(user);
    }

    return user;
  }

  FutureOr<bool> checkFacebookLogin() async {
    final accessToken = await FacebookAuth.instance.accessToken;
    if (accessToken != null) {
      print("is Logged:::: ${prettyPrint(accessToken.toJson())}");
      return true;
    } else {
      return false;
    }
  }

  Future<User?> loginApple() async {
    final AuthorizationResult result = await TheAppleSignIn.performRequests([
      const AppleIdRequest(requestedScopes: [Scope.email, Scope.fullName])
    ]);

    User user = User();
    switch (result.status) {
      case AuthorizationStatus.authorized:
        user.socialNetwork = SocialNetwork.Apple;
        user.emailAddress = result.credential?.email;
        user.name =
            "${result.credential?.fullName?.givenName} ${result.credential?.fullName?.familyName}";
        saveLocalUser(user);
        break;

      case AuthorizationStatus.error:
        print("Sign in failed: ${result.error?.localizedDescription}");
        break;

      case AuthorizationStatus.cancelled:
        print('User cancelled');
        break;
    }

    return user;
  }

  String prettyPrint(Map json) {
    JsonEncoder encoder = const JsonEncoder.withIndent('  ');
    String pretty = encoder.convert(json);
    return pretty;
  }

  User createUserFromSocial(
      String name, String email, SocialNetwork socialNetwork, String imageUrl) {
    User user = User(
        emailAddress: email,
        name: name,
        socialNetwork: socialNetwork,
        imageUrl: imageUrl);

    return user;
  }

  void saveLocalUser(User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    print(json.encode(user));
    await preferences.setString('user', json.encode(user));
  }

  Future<User?> getSavedInfo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    final String? localUser = preferences.getString("user");
    if (localUser != null) {
      Map userMap = jsonDecode(preferences.getString("user")!);
      User user = User.fromJson(userMap);
      savedUser = user;
      return user;
    } else {
      return null;
    }
  }
}
