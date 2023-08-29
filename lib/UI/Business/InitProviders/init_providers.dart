// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';

class InitProviders extends StatelessWidget {
  const InitProviders({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
          child: child,
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(context: context),
        ),
        ChangeNotifierProvider(
          create: (context) => PostProvider(context: context),
        ),
      ],
      child: child,
    );
  }
}
