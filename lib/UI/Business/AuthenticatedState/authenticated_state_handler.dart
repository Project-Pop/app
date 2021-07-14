// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/home_base_handler.dart';
import 'package:app/UI/Business/InitProviders/init_user_providers.dart';
import 'package:app/UI/Business/SignUp/sign_up_handler.dart';

class AuthenticatedStateHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InitUserProviders(
      child: Consumer<UserProvider>(
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
      ),
    );
  }
}
