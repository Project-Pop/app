// Flutter imports:
import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      accentColor: Colors.white,
      scaffoldBackgroundColor: Colors.black,
      fontFamily: 'Monteserrat',
      buttonTheme: ButtonThemeData(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: Colors.black87,
      ),
    );
  }
}
