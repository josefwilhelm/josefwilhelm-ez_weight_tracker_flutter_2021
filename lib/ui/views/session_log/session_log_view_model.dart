import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SessionLogViewModel extends CustomBaseViewModel {
  Future<void> init() async {}

  void onFabPressed() {}

  Future<void> onAddSessionPressed(Duration? time) async {
    if (time != null) {
      if (time.inMinutes < 1) {
        showSnackbar(message: S.current.snackbar_minSessionLengthInfo);
        return;
      }

      final now = DateTime.now();

      final date = await showDatePicker(
        context: Get.context!,
        initialDate: now,
        firstDate: DateTime(2010),
        lastDate: now,
      );

      if (date == null) {
        return;
      }

      meditationService.saveSession(
        time.inSeconds,
        sessionType: SessionType.session_log,
        date: DateTime(
          date.year,
          date.month,
          date.day,
          12,
          now.minute,
          now.second,
          now.millisecond,
          now.microsecond,
        ),
      );
      firebaseService.logEvent('session_logged_manually',
          parameters: {'_duration': time.inSeconds});

      notifyListeners();
    }
  }

  void onDismissed(Session session) {
    sessions.remove(session);
    notifyListeners();
    meditationService.removeSession(session);
  }
}
