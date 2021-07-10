import 'package:flutter/material.dart';

import 'UI/Views/Theme/customTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.darkTheme,
      home: Scaffold(),
    );
  }
}
