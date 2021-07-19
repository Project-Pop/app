import 'package:app/UI/Views/HomeBase/Profile/constants/colors.dart';
import 'package:flutter/material.dart';

class FollowWidget extends StatelessWidget {
  const FollowWidget({Key key, this.color, this.name}) : super(key: key);
  final Color color;
  final String name;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: color,
      ),
      child: Center(
        child: Text(name,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: color == bgWhite ? Colors.black : bgWhite,
                fontSize: 12)),
      ),
    );
  }
}
