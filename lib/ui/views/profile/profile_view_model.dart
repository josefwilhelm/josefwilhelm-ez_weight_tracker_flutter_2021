import 'dart:async';

import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/ui/views/authentication_view/authentication_bottom_sheet_view.dart';
import 'package:ez_meditation_app/ui/views/edit_profile/edit_profile_view.dart';
import 'package:ez_meditation_app/ui/views/session_log/session_log_view.dart';
import 'package:get/get.dart';

class ProfileViewModel extends CustomBaseViewModel {
  bool get isUserLoggedIn => user != null;

  void init() {
    listen();
  }

  String? get getProfileUrl {
    if (isUserLoggedIn) {
      return user?.photoUrl;
    }
  }

  Future<void> onLoginPressed() async {
    await Get.bottomSheet(AuthenticationBottomSheetView());
    notifyListeners();
  }

  Future<void> onEditPressed() async {
    await Get.to(() => EditProfileView());
    notifyListeners();
  }

  Future<void> onLogSessionPressed() async {
    await Get.to(() => SessionLogView());
    notifyListeners();
  }

  List<Session> getEventsForDay(DateTime day) {
    final list = <Session>[];
    meditationService.sessions.forEach((session) {
      if (areDatesOnSameDay(session.dateTime, day)) {
        list.add(session);
      }
    });
    return list;
  }
}
