// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/home_base_handler.dart';
import 'package:app/UI/Business/SignUp/sign_up_handler.dart';

class AuthenticatedStateHandler extends StatefulWidget {
  @override
  _AuthenticatedStateHandlerState createState() =>
      _AuthenticatedStateHandlerState();
}

class _AuthenticatedStateHandlerState extends State<AuthenticatedStateHandler> {
  void _initUserProviders() {
    Provider.of<UserProvider>(context, listen: false).initiate();
  }

  @override
  void initState() {
    _initUserProviders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, loadingWidget) {
        if (userProvider.loaded == false) {
          return loadingWidget;
        }
        if (userProvider.user == null) {
          return SignUpHandler();
        }

        return HomeBaseHandler();
      },
      // TODO: define this loading widget in Views/
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
