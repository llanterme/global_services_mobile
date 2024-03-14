import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:quickalert/quickalert.dart';

import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/login_view_model.dart';
import 'base_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onModelReady: (model) => model.getSavedInfo().then((value) {
              if (value != null) {
                Navigator.pushNamed(context, 'landing', arguments: value);
              }
            }),
        builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                  const SizedBox(height: 20),
                  model!.state == ViewState.Busy
                      ? const CircularProgressIndicator()
                      : Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 100),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                alignment: Alignment.center,
                                height: 200,
                                width: (MediaQuery.of(context!).size.width),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.contain,
                                        image: AssetImage(
                                            "assets/images/PngItem_5349697.png"))),
                              ),
                              const Divider(),
                              SignInButton(Buttons.FacebookNew,
                                  onPressed: () async {
                                await model.loginFacebook().then((value) {
                                  if (value == null) {
                                    QuickAlert.show(
                                      context: context,
                                      type: QuickAlertType.error,
                                      text: model.errorMessage,
                                    );
                                  } else {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushNamed(context, 'landing',
                                        arguments: value);
                                  }
                                });
                              }),
                              const SizedBox(height: 10),
                              SignInButton(Buttons.Apple, onPressed: () async {
                                await model.loginApple().then((value) {
                                  if (value != null) {
                                    Navigator.pushNamed(context, 'landing',
                                        arguments: value);
                                  }
                                });
                              })
                            ],
                          ),
                        )
                ])))));
  }
}
