// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:app/UI/Views/HomeBase/Widgets/custom_text.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key? key, required this.icon, this.onTap})
      : super(key: key);
  final Icon icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        child: IconButton(
          onPressed: onTap,
          icon: icon,
          color: Colors.green,
        ),
      ),
    );
  }
}
