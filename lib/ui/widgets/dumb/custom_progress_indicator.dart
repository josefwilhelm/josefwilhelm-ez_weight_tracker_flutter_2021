import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  final Color? color;
  final double? height;

  const CustomProgressIndicator(
      {Key? key, this.color = turkish, this.height = 20})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        width: height,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 2,
        ));
  }
}
