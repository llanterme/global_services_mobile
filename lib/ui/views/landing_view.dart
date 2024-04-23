import 'package:flutter/material.dart';
import 'package:global_services_mobile/core/models/user_model.dart';
import 'package:global_services_mobile/core/viewmodels/landing_view_model.dart';
import 'package:global_services_mobile/ui/utils/utils.dart';
import 'package:global_services_mobile/ui/views/activities_view.dart';
import 'package:global_services_mobile/ui/views/take_photo_view.dart';
import '../../core/enums/viewstate.dart';

import 'base_view.dart';
import 'trend_graph_view.dart';

class LandingView extends StatelessWidget {
  int _currentIndex = 0;

  final List<Widget> _tabs = [ActivitiesView(), TakePhotoView(), TrendsView()];

  @override
  Widget build(BuildContext context) {
    return BaseView<LandingViewModel>(
        onModelReady: (model) => model.setupUser(),
        builder: (context, model, child) => Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: (int index) {
                model.setState(ViewState.Idle);
                _currentIndex = index;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.list_alt_outlined),
                  label: 'history',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.photo_camera_back_outlined),
                  label: 'snap',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined),
                  label: 'trends',
                ),
              ],
            ),
            body: _tabs[_currentIndex]));
  }
}
