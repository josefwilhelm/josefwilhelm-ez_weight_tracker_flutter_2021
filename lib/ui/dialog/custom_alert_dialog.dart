import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? positiveButtonText;
  final String? negativeButtonText;
  final String? message;
  final Widget? content;
  final VoidCallback? onPositivePressed;
  final VoidCallback? onNegativePressed;
  final Color? backgroundColor;

  const CustomAlertDialog({
    Key? key,
    required this.title,
    this.positiveButtonText,
    this.negativeButtonText,
    this.onPositivePressed,
    this.onNegativePressed,
    this.message,
    this.content,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: backgroundColor,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Text(title),
      content: content ??
          Container(
            width: double.infinity,
            child: Text(
              message ?? '',
              style: body,
            ),
          ),
      actions: [
        TextButton(
            onPressed: () {
              Get.back();
              if (onNegativePressed != null) {
                onNegativePressed!();
              }
            },
            child: Text((negativeButtonText ?? S.of(context).global_cancel)
                .toUpperCase())),
        TextButton(
            onPressed: () {
              Get.back();
              if (onPositivePressed != null) {
                onPositivePressed!();
              }
            },
            child: Text(
              (positiveButtonText ?? S.of(context).finish_discardDialogButton)
                  .toUpperCase(),
            )),
      ],
    );
  }
}
