// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:app/Services/ApiServices/index.dart';

class InitApiServiceProviders extends StatelessWidget {
  const InitApiServiceProviders({this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // USER API SERVICE
        Provider(
          create: (_) => UserApiService.create(),
          dispose: (context, service) => service.client.dispose(),
        ),
        // POST API SERVICE
        Provider(
          create: (_) => PostApiService.create(),
          dispose: (context, service) => service.client.dispose(),
        ),
      ],
      child: child,
    );
  }
}
