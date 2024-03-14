import 'package:flutter/material.dart';
import 'package:global_services_mobile/core/models/user.dart';
import 'package:global_services_mobile/ui/views/home_view.dart';
import 'package:global_services_mobile/ui/views/profile_list_view.dart';
import 'package:global_services_mobile/ui/views/profile_view.dart';
import '../../core/enums/viewstate.dart';
import '../../core/viewmodels/register_view_model.dart';

import 'base_view.dart';

class LandingView extends StatelessWidget {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    HomeView(),
    ProfileView(),
    ProfileListView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BaseView<RegisterViewModel>(
        onModelReady: (model) async {},
        builder: (context, model, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                model.setState(ViewState.Idle);
                _currentIndex = index;
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.man_2_outlined),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.map),
                  label: 'Favorites',
                ),
              ],
            ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,
            // floatingActionButton: FloatingActionButton.large(
            //   elevation: 12,
            //   backgroundColor: const Color.fromRGBO(82, 170, 94, 1.0),
            //   onPressed: () {
            //     Navigator.pushNamed(context, 'profile-list');
            //   },
            //   child: const Icon(Icons.star, color: Colors.white, size: 28),
            // ),
            body: _tabs[_currentIndex]));
  }
}
