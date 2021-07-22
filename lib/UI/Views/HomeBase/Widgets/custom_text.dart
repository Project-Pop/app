import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  const MyText(
      {Key key,
      this.msg,
      this.textStyle,
      this.maxLines,
      this.textAlign,
      this.textScaleFactor})
      : super(key: key);
  final String msg;
  final TextStyle textStyle;
  final int maxLines;
  final TextAlign textAlign;
  final double textScaleFactor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText(
        msg,
        style: textStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        textScaleFactor: textScaleFactor,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText(
      {Key key,
      this.msg,
      this.textStyle,
      this.maxLines,
      this.textAlign,
      this.textScaleFactor})
      : super(key: key);
  final String msg;
  final TextStyle textStyle;
  final int maxLines;
  final TextAlign textAlign;
  final double textScaleFactor;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: AutoSizeText(
        msg,
        style: textStyle,
        maxLines: maxLines,
        textAlign: textAlign,
        textScaleFactor: 1.9,
      ),
    );
  }
}
