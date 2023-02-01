import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;
  final IconData? iconData;
  final Color? iconColor;
  final double width;
  final TextStyle? textStyle;

  const PrimaryButton({
    required this.onPressed,
    required this.title,
    this.color = jetBlack,
    this.width = double.infinity,
    this.iconData,
    this.iconColor,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: Container(
          width: width,
          child: ElevatedButton.icon(
            onPressed: onPressed,
            icon: iconData == null
                ? Container()
                : Icon(
                    iconData,
                    color: iconColor,
                  ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return color.withOpacity(0.50);
                  }
                  return color; // Defer to the widget's default.
                }),
                foregroundColor: MaterialStateProperty.resolveWith<Color>(
                    (Set<MaterialState> states) {
                  if (states.contains(MaterialState.disabled)) {
                    return color.withOpacity(0.75);
                  }
                  return color; // Defer to the widget's default.
                }),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(buttonBorderRadius))))),
            label: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                title,
                style: textStyle ?? title4.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
