import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:quickalert/quickalert.dart';

import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/login_view_model.dart';
import 'base_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                  const SizedBox(height: 20),
                  model.state == ViewState.Busy
                      ? const CircularProgressIndicator()
                      : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 100),
                              SignInButton(
                                Buttons.Facebook,
                                onPressed: () async {
                                  var user = await model.loginFacebook();
                                  if (user == null) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      text: model.errorMessage,
                                    );
                                  } else {
                                    Navigator.pushNamed(context, 'landing',
                                        arguments: user);
                                  }
                                },
                              ),
                            ],
                          ),
                        )
                ])))));
  }
}
