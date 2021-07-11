import 'package:app/ConfigReader/configReader.dart';
import 'package:app/UI/Business/Authentication/authHandler.dart';
import 'package:flutter/material.dart';

import 'UI/Views/Theme/customTheme.dart';

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await ConfigReader.initialize(env);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: AuthHandler(),
    );
  }
}
