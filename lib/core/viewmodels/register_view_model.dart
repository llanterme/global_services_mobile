import 'dart:async';
import 'dart:convert';

import '../../locator.dart';
import '../enums/viewstate.dart';
import '../models/base_response.dart';
import '../models/user.dart';
import '../network/api.dart';
import 'base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  String errorMessage;
  final Api _api = locator<Api>();

  Future<User> registerUser(User user) async {
    try {
      setState(ViewState.Busy);
      var newUser = await _api.registerUser(user);
      setState(ViewState.Idle);
      return newUser;
    } catch (e) {
      var error = BaseResponse.fromJson(json.decode(e));
      errorMessage = error.responseMessage;
      setState(ViewState.Idle);
      return null;
    }
  }
}
