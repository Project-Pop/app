import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

Widget getAppBar(String userTagName, bool isMine) {
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
                msg: userTagName,
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
          IconButton(
              onPressed: () {},
              icon: isMine
                  ? const Icon(Icons.settings, color: Colors.white, size: 25)
                  : const Icon(Icons.more_horiz, color: Colors.white, size: 25))
        ]),
      ),
    ),
  );
}