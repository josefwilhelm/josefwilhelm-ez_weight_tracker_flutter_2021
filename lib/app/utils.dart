import 'package:duration/duration.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/debug_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String? validateEmail(String? email) {
  if (email?.isEmpty ?? true) {
    return S.current.global_warningFieldRequired;
  } else if (!isValidEmail(email)) {
    return S.current.email_notValidWarning;
  } else {
    return null;
  }
}

String? validateUsername(String? userName) {
  if (userName?.isEmpty ?? true) {
    return S.current.global_warningFieldRequired;
  } else {
    return null;
  }
}

String? validatePassword(String? password) {
  final pattern = '(?=.*[0-9a-zA-Z]).{6,}';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(password ?? '')) {
    return S.current.password_minLengthWarning;
  } else {
    return null;
  }
}

bool isValidEmail(String? email) {
  final pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  final regex = RegExp(pattern);
  if (!regex.hasMatch(email ?? '')) {
    return false;
  } else {
    return true;
  }
}

enum SnackbarType { success, info }

void showSnackbar(
    {String? title, String? message, SnackbarType type = SnackbarType.info}) {
  Get.rawSnackbar(
    title: title,
    message: message,
    icon: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: Icon(
        type == SnackbarType.success
            ? SFSymbols.checkmark
            : SFSymbols.info_circle,
        color: turkish,
        size: 24,
      ),
    ),
    margin: EdgeInsets.all(20),
    padding: EdgeInsets.all(20),
    snackPosition: SnackPosition.TOP,
    backgroundColor: soot,
    borderRadius: 8,
    duration: Duration(milliseconds: 2500),
  );
}

Widget debugButton() {
  return Padding(
    padding: EdgeInsets.only(right: 12),
    child: IconButton(
      onPressed: showDebugMenu,
      icon: Icon(
        SFSymbols.car_fill,
        size: 32,
      ),
    ),
  );
}

void showDebugMenu() {
  Get.dialog(DebugMenu());
}

bool areDatesOnSameDay(DateTime dateTime, DateTime dateTime2) {
  return dateTime.year == dateTime2.year &&
      dateTime.month == dateTime2.month &&
      dateTime.day == dateTime2.day;
}

String prettySessionDuration(int seconds, {bool short = false}) {
  return printDuration(
      Duration(
        seconds: seconds,
      ),
      abbreviated: short);
}

String formatDateFull(DateTime dateTime) {
  return '${DateFormat.yMd().format(dateTime)} - ${formatDateHM(dateTime)}';
}

String formatDateHM(DateTime dateTime) {
  return DateFormat.Hm().format(dateTime);
}

String formatDate(DateTime dateTime) {
  return DateFormat.yMMMd().format(dateTime);
}
