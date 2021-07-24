// Flutter imports:
import 'dart:io';

import 'package:app/Providers/auth_provider.dart';
import 'package:app/Providers/user_provider.dart';
import 'package:app/UI/Business/HomeBase/home_base_handler.dart';
import 'package:app/UI/Business/SignUp/sign_up_handler.dart';
import 'package:app/UI/Views/HomeBase/Profile/profile_page.dart';
import 'package:app/UI/Views/HomeBase/Profile/widgets/custom_profile_button.dart';
import 'package:app/UI/Views/HomeBase/Widgets/custom_bottom_navigation_bar.dart';
import 'package:app/UI/Views/HomeBase/home_base.dart';
import 'package:app/UI/Views/SignUp/take_username.dart';
import 'package:app/UI/Views/SignUp/sign_up_page.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_phoenix/flutter_phoenix.dart';

// Project imports:
import 'package:app/Configs/config_reader.dart';
import 'package:app/Services/Connectivity/connectivity_status.dart';
import 'package:app/UI/Business/Authentication/auth_handler.dart';
import 'package:provider/provider.dart';
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
  TextEditingController usernameController;
  TextEditingController nameController;
  TextEditingController emailController;
  Future<bool> Function(String username) checkUsernameAvailability;
  GlobalKey<FormState> formKey;
  Function({@required DateTime dob, @required File avatar}) signUpUser;
  Future Function() logOut;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: CustomTheme.darkTheme,
        home:
            /* MultiProvider(providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(
              create: (context) => UserProvider(context: context))
        ], child: SignUpHandler())*/

            //HomeBaseHandler()

            ProfilePage(
          postCount: '12',
          reactCount: '0',
          viewsCount: '0',
          imageProfile: null,
          isMine: true,
          followOrFollowing: Container(),
          pops: const [1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0],
          cameraPops: const [1, 2, 3, 4, 5],
          userName: 'michal wade',
          userTagName: 'xyz@gmail',
          userUrl: 'xyz@pop',
          isAlreadyFollow: true,
          profileButtonWidget: ProfileButtonWidget(
            color: Colors.white,
            name: 'follow',
            onTap: () {},
          ),
        ));
  }
}
