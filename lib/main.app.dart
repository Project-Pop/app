// Flutter imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/home_base_handler.dart';
import 'package:app/UI/Views/HomeBase/Widgets/vidss.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/camera_page.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/tag_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phoenix/flutter_phoenix.dart';

// Project imports:
import 'package:app/Configs/config_reader.dart';
import 'package:app/Services/Connectivity/connectivity_status.dart';
import 'package:app/UI/Business/Authentication/auth_handler.dart';
import 'package:app/UI/Business/InitProviders/init_providers.dart';
import 'package:provider/provider.dart';
import 'UI/Business/HomeBase/DiscoveryPage/discovery_page_handler.dart';
import 'UI/Views/Theme/custom_theme.dart';

Future<void> mainApp(String env) async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    ConfigReader.initialize(env),
    ConnectionStatus.getInstance().initialize()
  ]);

  //runApp(Phoenix(child: MyApp()));
  runApp(TestWidgets());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InitProviders(
      child: MaterialApp(
        title: 'App',
        theme: CustomTheme.darkTheme,
        home: AuthHandler(),
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
        home:
            /*ChangeNotifierProvider(
            create: (_) => UserProvider(context: context),
            child: DiscoveryPageHandler())*/
            OpenCamera());
  }
}
