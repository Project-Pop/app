// Flutter imports:
import 'package:app/UI/Views/HomeBase/Profile/profile_page.dart';
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

  //runApp(Phoenix(child: MyApp()));
  runApp(TestWidgets());
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
        home: ProfilePage(
          postCount: '12',
          reactCount: '0',
          viewsCount: '0',
          imageProfile: Image.network(
              'https://th.bing.com/th/id/OIP.gDBdAA5pacZzSnpFUHEKPgHaGA?pid=ImgDet&rs=1'),
          isMine: true,
          followOrFollowing: Container(),
          pops: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0],
          cameraPops: const [1, 2, 3, 4, 5],
          userName: 'michal wade',
          userTagName: 'xyz@gmail',
          userUrl: 'xyz@pop',
          isAlreadyFollow: true,
        ));
  }
}
