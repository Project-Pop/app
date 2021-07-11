import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/InitProviders/initUserProviders.dart';
import 'package:app/UI/Business/SignUp/signUpHandler.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

          // TODO: return home page
          return loadingWidget;
        },
        // TODO: define this loading widget in Views/
        child: Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }
}
