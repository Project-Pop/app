// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phoenix/flutter_phoenix.dart';

// Project imports:
import 'package:app/Configs/config_reader.dart';
import 'package:app/Services/Connectivity/connectivity_status.dart';
import 'package:app/UI/Business/Authentication/auth_handler.dart';
import 'UI/Views/Theme/custom_theme.dart';

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    ConfigReader.initialize(env),
    ConnectionStatus.getInstance().initialize()
  ]);

  runApp(Phoenix(child: MyApp()));
  // runApp(TestWidgets());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: CustomTheme.darkTheme,
      home: AuthHandler(),
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
