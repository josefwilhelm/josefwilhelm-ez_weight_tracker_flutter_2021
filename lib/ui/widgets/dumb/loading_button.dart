import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color color;
  final double width;
  final bool isBusy;

  LoadingButton({
    required this.onPressed,
    required this.title,
    this.color = jetBlack,
    this.width = 100,
    this.isBusy = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
        child: InkWell(
          onTap: onPressed,
          enableFeedback: true,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            curve: Curves.decelerate,
            width: isBusy ? 200 : MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(4.0),
            height: 48,
            decoration: isBusy
                ? BoxDecoration(color: Colors.transparent)
                : BoxDecoration(
                    color: onPressed == null ? color.withOpacity(0.5) : color,
                    borderRadius: BorderRadius.circular(isBusy ? 25.0 : 4.0),
                  ),
            child: Center(
              child: isBusy
                  ? Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        child: LinearProgressIndicator(
                          // strokeWidth: 3,
                          backgroundColor: Colors.transparent,
                          valueColor: AlwaysStoppedAnimation(color),
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        title,
                        style: title4.copyWith(color: Colors.white),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
