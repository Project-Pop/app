// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_icons/flutter_icons.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({Key key, this.itemName, this.onTap, this.icon})
      : super(key: key);

  final String itemName;
  final Function() onTap;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: onTap,
                  icon: icon,
                  color: Colors.white,
                  iconSize: 16,
                ),
                const SizedBox(width: 13),
                MyText(
                  msg: itemName,
                  textStyle: const TextStyle(color: Colors.white),
                ),
              ],
            ),
            IconButton(
                onPressed: onTap,
                icon: const Icon(
                  FlutterIcons.arrow_bold_right_ent,
                  color: Colors.white60,
                  size: 16,
                ))
          ],
        ),
      ),
    );
  }
}
