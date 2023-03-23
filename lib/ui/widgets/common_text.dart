import 'package:flutter/material.dart';
import 'package:shoesappclient/ui/general/brand_color.dart';

class BaseText extends StatelessWidget {
  String text;
  double fontSize;
  Color? color;
  FontWeight? fontWeight;
  double? height;

  BaseText({
    required this.text,
    required this.fontSize,
    this.color,
    this.fontWeight,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? BrandColor.primaryFontColor,
        fontWeight: fontWeight,
        height: height,
      ),
    );
  }
}

class H1 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H1({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 28.0,
      color: color,
      fontWeight: FontWeight.w700,
      height: height,
    );
  }
}

class H2 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H2({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 24.0,
      color: color,
      fontWeight: FontWeight.w600,
      height: height,
    );
  }
}

class H3 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H3({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 20.0,
      color: color,
      fontWeight: FontWeight.w500,
      height: height,
    );
  }
}

class H4 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H4({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 18.0,
      color: color,
      fontWeight: FontWeight.w500,
      height: height,
    );
  }
}

class H5 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H5({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 14.0,
      color: color,
      fontWeight: FontWeight.w500,
      height: height,
    );
  }
}

class H6 extends StatelessWidget {
  String text;
  Color? color;
  double? height;
  H6({
    required this.text,
    this.color,
    this.height,
  });
  @override
  Widget build(BuildContext context) {
    return BaseText(
      text: text,
      fontSize: 12.0,
      color: color,
      fontWeight: FontWeight.w500,
      height: height,
    );
  }
}
