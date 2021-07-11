import 'package:app/Providers/UserProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitUserProviders extends StatelessWidget {
  final Widget child;
  const InitUserProviders({this.child});
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
