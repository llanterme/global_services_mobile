import 'package:flutter/material.dart';
import 'package:global_services_mobile/ui/utils/utils.dart';
import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/login_view_model.dart';
import 'base_view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onModelReady: (model) => Utils.getSavedInfo().then((value) {
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
                              children: []))
                ])))));
  }
}
