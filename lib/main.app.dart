// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phoenix/flutter_phoenix.dart';

// Project imports:
import 'package:app/ConfigReader/config_reader.dart';
import 'package:app/UI/Business/Authentication/auth_handler.dart';
import 'package:app/UI/Business/InitProviders/init_api_service_providers.dart';
import 'UI/Views/Theme/custom_theme.dart';

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize(env);

  runApp(Phoenix(child: MyApp()));
  // runApp(TestWidgets());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: CustomTheme.darkTheme,
      home: InitApiServiceProviders(
        child: AuthHandler(),
      ),
    );
  }
}

class TestWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: Container(),
    );
  }
}
