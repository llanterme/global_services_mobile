import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../../core/enums/viewstate.dart';
import '../../core/models/user.dart';
import '../../core/viewmodels/register_view_model.dart';
import '../widgets/register.dart';
import 'base_view.dart';

class RegisterView extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final bool _autoValidate = true;

  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text(
              "Register",
              style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,
                  color: Colors.white),
            )),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 100),
              Container(
                // ignore: unnecessary_new
                child: new Form(
                    key: _formKey,
                    child: Register(
                      mobileNumbercontroller: _mobileNumberController,
                      emailAddressController: _emailController,
                      nameController: _nameController,
                    )),
              ),
              model.state == ViewState.Busy
                  ? const CircularProgressIndicator()
                  : Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 15.0),
                              alignment: Alignment.center,
                              child: ButtonTheme(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15.0),
                                  minWidth: 300.0,
                                  height: 50,
                                  child: ElevatedButton(
                                    child: const Text(
                                      'Login',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        var newUser =
                                            await model.registerUser(getUser());

                                        if (newUser != null) {
                                          Navigator.pushNamed(
                                              context, 'landing',
                                              arguments: newUser);
                                        } else {
                                          QuickAlert.show(
                                            context: context,
                                            type: QuickAlertType.error,
                                            title: 'Oops...',
                                            text: model.errorMessage,
                                          );
                                        }
                                      }
                                    },
                                  )),
                            )
                          ]),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  User getUser() {
    User user = User();
    user.emailAddress = _emailController.text;
    user.mobileNumber = _mobileNumberController.text;
    user.name = _nameController.text;

    return user;
  }
}
