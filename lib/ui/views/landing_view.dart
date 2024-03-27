import 'package:flutter/material.dart';
import 'package:global_services_mobile/core/models/profile.dart';
import 'package:global_services_mobile/core/viewmodels/login_view_model.dart';
import 'package:global_services_mobile/ui/utils/utils.dart';
import 'package:global_services_mobile/ui/views/athlete_activities.dart';
import 'package:global_services_mobile/ui/views/home_view.dart';
import '../../core/enums/viewstate.dart';

import 'base_view.dart';

class LandingView extends StatelessWidget {
  Profile? profile;

  LandingView({this.profile});

  int _currentIndex = 0;

  final List<Widget> _tabs = [HomeView(), ActivitiesView()];

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                model.setState(ViewState.Idle);
                _currentIndex = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Activities',
                ),
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: FloatingActionButton.large(
              elevation: 12,
              backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
              onPressed: () {
                Utils.removeLocalProfile();
                model.deAuth();
              },
              child: const Icon(Icons.star, color: Colors.white, size: 28),
            ),
            body: _tabs[_currentIndex]));
  }
}
