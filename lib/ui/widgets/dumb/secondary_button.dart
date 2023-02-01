import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/widgets/dumb/primary_button.dart';
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Color? color;

  const SecondaryButton({
    required this.onPressed,
    required this.title,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      title: title,
      onPressed: onPressed,
      color: color ?? jetBlack.withOpacity(0.5),
    );
  }
}
