// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/user_provider.dart';

class InitUserProviders extends StatelessWidget {
  const InitUserProviders({this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(context: context),
        ),
      ],
      child: child,
    );
  }
}
