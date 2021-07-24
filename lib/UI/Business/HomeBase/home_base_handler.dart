// Flutter imports:
import 'package:app/UI/Views/HomeBase/search_page/grid_view_page.dart';
import 'package:app/UI/Views/HomeBase/search_page/search_page.dart';
import 'package:app/UI/Views/models/search_user_model.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Profile/profile_page.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_bottom_navigation_bar.dart';
import 'package:app/UI/Views/HomeBase/home_base.dart';
import 'package:flutter/services.dart';

class HomeBaseHandler extends StatefulWidget {
  @override
  _HomeBaseHandlerState createState() => _HomeBaseHandlerState();
}

class _HomeBaseHandlerState extends State<HomeBaseHandler> {
  final _pageController = PageController();

  void _navItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit an App'),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('No'),
              ),
              TextButton(
                onPressed: () => SystemNavigator.pop(),
                child: const Text('Yes'),
              ),
            ],
          ),
        )) ??
        false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: HomeBase(
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
      ),
    );
  }
}
