import 'package:ez_meditation_app/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hint;
  final String? errorText;
  final String? label;
  final bool obscure;
  final int? characterLimit;
  final TextStyle? labelStyle;
  final TextStyle? textStyle;
  final TextStyle hintStyle;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final Function(String?)? onSubmitted;
  final Function()? onTap;
  final bool hasValue;
  final int? maxLength;
  final Color? color;
  final bool showBorder;
  final String? prefix;
  final double? textFieldWidth;
  final EdgeInsets? contentPadding;
  final IconData? prefixIcon;
  final double? prefixIconSize;
  final EdgeInsets prefixIconPadding;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? formatters;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? onTrailingPressed;
  final int? minLines;
  final int? maxLines;
  final bool showSuffix;
  final Color lineColor;
  final VoidCallback? onSuffixPressed;

  const CustomTextFormField({
    Key? key,
    this.hint,
    this.controller,
    this.onChanged,
    this.minLines,
    this.errorText,
    this.characterLimit,
    this.obscure = false,
    this.validator,
    this.formatters,
    this.focusNode,
    this.showBorder = false,
    this.prefix = '',
    this.textFieldWidth = double.infinity,
    this.keyboardType,
    this.color = Colors.white,
    this.textInputAction,
    this.textStyle = body,
    this.hintStyle = hint1,
    this.onSubmitted,
    this.onTap,
    this.lineColor = jetBlack,
    this.labelStyle = title3,
    this.maxLength,
    this.hasValue = false,
    this.contentPadding =
        const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    this.maxLines = 1,
    this.prefixIcon,
    this.suffixIcon,
    this.label,
    this.prefixIconPadding = const EdgeInsets.only(right: 12.0, left: 6),
    this.prefixIconSize = 16,
    this.onTrailingPressed,
    this.onSuffixPressed,
    this.showSuffix = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (label != null)
          Text(
            label!,
            style: labelStyle,
          ),
        smallSpace,
        TextFormField(
          textAlignVertical: TextAlignVertical.center,
          key: key,
          onTap: onTap,
          keyboardType: keyboardType,
          obscureText: obscure,
          style: textStyle,
          controller: controller,
          focusNode: focusNode,
          autofocus: false,
          textInputAction: textInputAction,
          validator: validator,
          maxLength: maxLength,
          onFieldSubmitted: onSubmitted,
          minLines: minLines,
          maxLines: maxLines,

          onChanged: onChanged,
          inputFormatters: formatters ?? [],
          //onSubmitted: onSubmitted,
          decoration: InputDecoration(
            filled: true,
            isDense: true,
            counterStyle: caption2,
            counterText:
                characterLimit != null && (controller?.text.isNotEmpty ?? true)
                    ? '${controller?.text.length}/${characterLimit.toString()}'
                    : null,
            border: OutlineInputBorder(borderRadius: textFieldBorderRadius),
            fillColor: color,
            contentPadding: contentPadding,
            suffixIcon: showSuffix && (controller?.text.isNotEmpty ?? true)
                ? suffixIcon ??
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: GestureDetector(
                          onTap: onSuffixPressed,
                          child: suffixIcon ??
                              Icon(
                                SFSymbols.xmark,
                                color: soot,
                              )),
                    )
                : null,
            suffixIconConstraints: BoxConstraints(minWidth: 30, minHeight: 30),
            prefixIcon: prefixIcon != null
                ? Padding(
                    padding: prefixIconPadding,
                    child: Icon(
                      prefixIcon,
                      size: prefixIconSize,
                      color: color,
                    ),
                  )
                : null,
            prefixText: prefix,
            hintText: hint,
            errorStyle: caption2,
            prefixIconConstraints: BoxConstraints(minWidth: 20, minHeight: 0),
            hintStyle: hintStyle,
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: showBorder
                      ? Theme.of(context).accentColor
                      : Colors.transparent),
              borderRadius: textFieldBorderRadius,
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.transparent)),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  color: showBorder
                      ? (hasValue ? lineColor : lineColor.withOpacity(0.60))
                      : Colors.transparent),
              borderRadius: textFieldBorderRadius,
            ),
          ),
        ),
      ],
    );
  }
}
