import 'package:app/Providers/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitAuthProvider extends StatelessWidget {
  final Widget child;
  const InitAuthProvider({this.child});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: child,
    );
  }
}
