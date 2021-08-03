import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

Widget customAppBar(String title, BuildContext context) {
  return PreferredSize(
      preferredSize: const Size.fromHeight(55),
      child: SafeArea(
        child: AppBar(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              FlutterIcons.arrow_back_mdi,
              color: Colors.white,
              size: 20,
            ),
          ),
          title: MyText(
            msg: title,
            textStyle: const TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
      ));
}
