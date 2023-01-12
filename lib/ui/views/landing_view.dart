import 'package:flutter/material.dart';

import '../../core/enums/viewstate.dart';
import '../../core/models/user.dart';
import '../../core/viewmodels/register_view_model.dart';
import '../../style.dart';
import 'base_view.dart';

class LandingView extends StatelessWidget {
  final User user;

  LandingView({this.user});

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        builder: (context, model, child) => Scaffold(
            appBar: AppBar(
                automaticallyImplyLeading: true,
                centerTitle: true,
                title: const Text(
                  "Home",
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 15.0,
                      color: Colors.white),
                )),
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
                              Text(user == null ? "" : 'Welcome ${user.name}',
                                  style: Styles.headerLarge),
                              const SizedBox(height: 20),
                              Container(
                                child: CircleAvatar(
                                  radius: 100.0,
                                  backgroundImage: NetworkImage(
                                    user.imageUrl,
                                  ),
                                  backgroundColor: Colors.transparent,
                                ),
                              ),
                            ],
                          ),
                        )
                ])))));
  }
}
