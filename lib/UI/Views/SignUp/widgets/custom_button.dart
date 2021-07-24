import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key key, this.icon, this.onTap}) : super(key: key);
  final Icon icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: Container(
           
            child: IconButton(
              onPressed: onTap,
              icon: icon,
              color: Colors.green,
            )),
      ),
    );
  }
}
