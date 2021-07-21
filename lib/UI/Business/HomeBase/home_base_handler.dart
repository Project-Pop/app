// Flutter imports:
import 'package:app/UI/Views/HomeBase/search_page/grid_view_page.dart';
import 'package:app/UI/Views/HomeBase/search_page/search_page.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/profile_page.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_bottom_navigation_bar.dart';
import 'package:app/UI/Views/HomeBase/home_base.dart';

class HomeBaseHandler extends StatefulWidget {
  @override
  _HomeBaseHandlerState createState() => _HomeBaseHandlerState();
}

class _HomeBaseHandlerState extends State<HomeBaseHandler> {
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
         SearchPageGridView(
          popList: [
            1,
            2,
            3,
            4,
            5,
            6,
            67,
            7,
          ],
        ),
        /* SearchPage(
          searchRecent: [
            SearchUser(
                imgUrl: 'assets/images/profile.png',
                name: 'xyz',
                userNAme: 'xuz@gamil'),
            SearchUser(
                imgUrl: 'assets/images/profile.png',
                name: 'xyz',
                userNAme: 'xuz@gamil')
          ],
          searchResults: [
            SearchUser(
                imgUrl: 'assets/images/profile.png',
                name: 'xyz',
                userNAme: 'xuz@gamil'),
            SearchUser(
                imgUrl: 'assets/images/profile.png',
                name: 'ayz',
                userNAme: 'xuy@gamil')
          ],
        ), */
        Container(),
        Container(),
        Container(),
        //ProfilePage(),
      ],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _navItemTapped,
      ),
    );
  }
}
