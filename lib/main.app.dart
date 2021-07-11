import 'dart:math';

import 'package:app/ConfigReader/configReader.dart';
import 'package:app/UI/Business/Authentication/authHandler.dart';
import 'package:app/UI/Business/InitProviders/initApiServiceProviders.dart';
import 'package:app/UI/Views/SignUp/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

import 'UI/Views/Theme/customTheme.dart';

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
  final a = TextEditingController();
  final b = TextEditingController();
  final c = TextEditingController();
  Future<bool> checkUsernameAvailability(String username) async {
    await Future.delayed(Duration(milliseconds: 300));

    return Random().nextBool();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: SignUpPage(
        nameController: a,
        emailController: b,
        usernameController: c,
        checkUsernameAvailability: checkUsernameAvailability,
      ),
    );
  }
}
