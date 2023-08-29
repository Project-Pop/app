// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/Theme/constants/colors.dart';

class ProfileButtonWidget extends StatelessWidget {
  const ProfileButtonWidget(
      {Key key, this.color = bgWhite, this.name, this.onTap})
      : super(key: key);
  final Color color;
  final String name;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 32,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.white),
        child: Center(
          child: Text(name,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: color == bgWhite ? Colors.black : bgWhite,
                fontSize: 12,
              )),
        ),
      ),
    );
  }
}
