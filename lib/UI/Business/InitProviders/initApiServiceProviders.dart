import 'package:app/Services/ApiServices/index.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InitApiServiceProviders extends StatelessWidget {
  final Widget child;
  InitApiServiceProviders({this.child});

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
