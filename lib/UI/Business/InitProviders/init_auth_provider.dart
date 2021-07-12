// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Providers/index.dart';

class InitAuthProvider extends StatelessWidget {
  const InitAuthProvider({
    this.child,
  });

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: child,
    );
  }
}
