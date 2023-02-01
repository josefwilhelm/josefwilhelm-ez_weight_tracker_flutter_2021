import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionButton extends StatelessWidget {
  CustomActionButton({required this.iconData, required this.onPress});

  final IconData iconData;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 5.0),
        )),
        onPressed: onPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Icon(
            iconData,
            size: 20,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }
}
