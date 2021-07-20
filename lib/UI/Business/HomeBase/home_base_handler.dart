// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Business/HomeBase/ProfilePage/profile_page_handler.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_bottom_navigation_bar.dart';
import 'package:app/UI/Views/HomeBase/home_base.dart';

class HomeBaseHandler extends StatelessWidget {
  final _pageController = PageController();

  void _navItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return HomeBase(
      controller: _pageController,
      pages: [
        Container(),
        Container(),
        Container(),
        ProfilePageHandler(),
      ],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _navItemTapped,
      ),
    );
  }
}
