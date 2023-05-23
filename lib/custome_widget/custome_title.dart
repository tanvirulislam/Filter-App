import 'package:flutter/material.dart';

class CustomeTitle extends StatelessWidget {
  String title;
  FontWeight fontWeight;
  double fontSize;
  CustomeTitle({
    Key? key,
    required this.title,
    required this.fontWeight,
    required this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
    );
  }
}
