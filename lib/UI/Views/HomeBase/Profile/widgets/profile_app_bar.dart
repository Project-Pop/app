// Flutter imports:
import 'package:app/UI/Views/HomeBase/settings_page/setting.dart';
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

Widget getAppBar(String username, bool isMine) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(55),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
        child: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 32.0),
              child: MyText(
                msg: username,
                textAlign: TextAlign.center,
                textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
                maxLines: 1,
                textScaleFactor: 1.2,
              ),
            ),
          ),
          if (isMine)
            IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                  //   return SettingsPage(
                  //       name: name, userAvatar: profile, userNmae: userName);
                  // }));
                },
                icon: const Icon(Icons.settings, color: Colors.white, size: 25))
          else
            IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.more_horiz, color: Colors.white, size: 25))
        ]),
      ),
    ),
  );
}
