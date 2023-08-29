// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

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
              Icons.arrow_back,
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
