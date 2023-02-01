import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class RoundedBottomSheet extends StatelessWidget {
  final Widget content;
  final String? title;

  const RoundedBottomSheet({Key? key, required this.content, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20),
        topLeft: Radius.circular(20),
      ),
      child: Container(
        color: fog,
        child: Column(
          children: [
            _buildHeader(context),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          title == null
              ? Flexible(child: SizedBox(width: double.infinity))
              : Expanded(
                  child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Text(
                    title!,
                    textAlign: TextAlign.center,
                    style: title3,
                  ),
                )),
          IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: Icon(SFSymbols.xmark))
        ],
      ),
    );
  }
}
