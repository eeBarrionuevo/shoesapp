import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  String text;
  double fontSize;
  BaseText({
    required this.text,
    required this.fontSize,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  String text;
  H1({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 28.0,
    );
  }
}

class H2 extends StatelessWidget {
  String text;
  H2({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 24.0,
    );
  }
}

class H3 extends StatelessWidget {
  String text;
  H3({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 20.0,
    );
  }
}
