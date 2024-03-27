import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:global_services_mobile/core/models/profile.dart';
import 'package:global_services_mobile/core/viewmodels/register_view_model.dart';
import 'package:global_services_mobile/ui/utils/utils.dart';
import 'package:global_services_mobile/ui/widgets/register_widget.dart';
import 'package:strava_client/strava_client.dart';
import '../../core/enums/viewstate.dart';
import 'base_view.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _surname = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        // onModelReady: (model) => Utils.getSavedInfo().then((value) {
        //       if (value != null) {
        //         Navigator.pushNamed(context, 'landing', arguments: value);
        //       }
        //     }),
        onModelReady: (model) {},
        builder: (context, model, child) => Scaffold(
                body: SingleChildScrollView(
                    child: Center(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                  const SizedBox(height: 20),
                  if (model.state == ViewState.Busy)
                    const CircularProgressIndicator()
                  else
                    Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100),
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 15.0, vertical: 15.0),
                            alignment: Alignment.center,
                            height: 200,
                            width: (MediaQuery.of(context).size.width),
                          ),
                          GestureDetector(
                            onTap: () async {
                              TokenResponse token = await model.authStrava();
                              if (token.accessToken.isNotEmpty) {
                                Navigator.pushNamed(context, 'landing');
                              }
                            },
                            child: const Image(
                              image: AssetImage(
                                  "assets/images/btn_strava_connectwith_orange.png"),
                            ),
                          ),
                          // SignInButton(
                          //   Buttons.Facebook,
                          //   onPressed: () async {
                          //     Profile? profile = await model.loginFacebook();
                          //     if (context.mounted) {
                          //       if (profile != null) {
                          //         Navigator.pushNamed(context, 'landing',
                          //             arguments: profile);
                          //       } else {
                          //         Utils.showGenericAlert(
                          //             context, model.errorMessage!, "");
                          //       }
                          //     }
                          //   },
                          // ),
                          // const SizedBox(height: 20),
                          // GestureDetector(
                          //   onTap: () async {
                          //     _displayBottomRegistrationSheet(context);

                          //     Map<String, String> result =
                          //         await _displayBottomRegistrationSheet(
                          //             context);

                          //     String? updatedEmail = result['email'];
                          //     String? updatedName = result['name'];
                          //     String? updatedSurname = result['surname'];
                          //   },
                          //   child: const Text("OR"),
                          // ),
                          // const SizedBox(height: 20),
                        ],
                      ),
                    ),
                ])))));
  }

  Future<Map<String, String>> _displayBottomRegistrationSheet(
      BuildContext context) {
    Completer<Map<String, String>> completer = Completer();

    final GlobalKey<FormState> _formKeyBottomSheet = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color.fromARGB(255, 73, 76, 90),
      barrierColor: Colors.black87.withOpacity(0.5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  child: Form(
                key: _formKeyBottomSheet,
                autovalidateMode: AutovalidateMode.always,
                child: RegisterWidget(
                  emailAddressController: _email,
                  surnameController: _surname,
                  nameController: _name,
                ),
              )),
              Container(
                child: TextButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            0.0), // Set to 0.0 for square border
                        side: const BorderSide(
                            color: Color.fromARGB(
                                255, 209, 207, 207)), // Add red border color
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (_formKeyBottomSheet.currentState!.validate()) {
                      String newEmail = _email.text;
                      String newName = _name.text;
                      String newSurname = _surname.text;

                      Map<String, String> updatedProfile = {
                        'email': newEmail,
                        'name': newName,
                        'surname': newSurname,
                      };

                      completer.complete(updatedProfile);
                      Navigator.pop(context); // Close the bottom sheet
                    }
                  },
                  child: const Text('Register'),
                ),
              ),
            ],
          ),
        ),
      ),
    );

    return completer.future;
  }
}
