import 'package:flutter/material.dart';

class BaseText extends StatelessWidget {
  String text;
  BaseText({
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
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
    );
  }
}
