import 'package:app/Providers/AuthProvider.dart';
import 'package:app/UI/Business/InitProviders/initAuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InitAuthProvider(
      child: Consumer<AuthProvider>(
        builder: (context, authProvider, loadingWidget) {
          if (authProvider.loaded == false) {
            return loadingWidget;
          }

          if (authProvider.isAuthenticated == false) {
            // TODO: return Login page
            return loadingWidget;
          }

          // TODO: return after auth screen
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
