// Flutter imports:
import 'package:app/UI/Views/HomeBase/camera_screen/camera_page.dart';
import 'package:app/UI/Views/HomeBase/home_page/home_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Configs/custom_logger.dart';
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/DiscoveryPage/discovery_page_handler.dart';
import 'package:app/UI/Business/HomeBase/ProfilePage/profile_page_handler.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_bottom_navigation_bar.dart';
import 'package:app/UI/Views/HomeBase/home_base.dart';
import 'package:flutter/services.dart';

class HomeBaseHandler extends StatefulWidget {
  @override
  _HomeBaseHandlerState createState() => _HomeBaseHandlerState();
}

class _HomeBaseHandlerState extends State<HomeBaseHandler> {
  final _pageController = PageController();
  UserProvider _userProvider;

  final _logger = CustomLogger.logger(HomeBaseHandler);

  void _navItemTapped(int index) {
    _logger.d(index);
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
  void initState() {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HomeBase(
      controller: _pageController,
      pages: [
        const HomePage(),
        DiscoveryPageHandler(),
        const OpenCamera(),
        Container(),
        ProfilePageHandler(_userProvider.user.username),
      ],
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: _navItemTapped,
      ),
    );
  }
}
