// Flutter imports:
import 'package:app/Providers/index.dart';
import 'package:app/UI/Business/HomeBase/home_base_handler.dart';
import 'package:app/UI/Views/HomeBase/Widgets/vidss.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/camera_page.dart';
import 'package:app/UI/Views/HomeBase/camera_screen/tag_page.dart';
import 'package:app/UI/Views/HomeBase/home_page/home_page.dart';
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
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: CustomTheme.darkTheme,
        home:
            /*const HomePage(
        popList: [
          'https://images.all-free-download.com/footage_preview/mp4/smartphone_touch_screen_navigation_1102.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/guitar_players_street_musicians_music_1101.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/stunt_motorbikes_synchronous_extreme_1095.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/stand_up_paddling_scuba_diving_836.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/hands_support_marriage_love_romance_770.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/pot_fire_cooking_flames_heat_kettle_1053.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/laptop_typing_notebook_computer_work_372.mp4',
          'https://images.all-free-download.com/footage_preview/mp4/acoustic_guitar_guitar_player_805.mp4'
        ],
      ),*/

            ChangeNotifierProvider(
                create: (_) => UserProvider(context: context),
                child: DiscoveryPageHandler()));
    //OpenCamera());
  }
}
