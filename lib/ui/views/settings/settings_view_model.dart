import 'dart:async';

import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/services/community_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/ui/dialog/custom_alert_dialog.dart';
import 'package:ez_meditation_app/ui/dialog/feedback_dialog.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';
import 'package:rate_my_app/rate_my_app.dart';

class SettingsViewModel extends CustomBaseViewModel {
  bool get notificationValue => storage.notifications;
  bool get screenOn => storage.screenOn;
  bool get playEndingBell => storage.playEndingBell;

  bool get isUserLoggedIn => firebaseService.ezUser != null;

  StreamSubscription? _streamSubscription;
  var version = '';

  Future<void> init() async {
    listen();
    final packageInfo = await PackageInfo.fromPlatform();
    version = packageInfo.version;
    notifyListeners();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }

  void onRatePressed() {
    try {
      RateMyApp(
        appStoreIdentifier: '1570800384',
      ).launchStore();
    } catch (e) {
      logger.e(e);
    }
  }

  void onNotificationChanged(bool value) {
    storage.notifications = value;
    notifyListeners();
  }

  void onOtherAppsPressed() {}

  void onTCPressed() {}

  void onClearMediationDataPressed() {
    firebaseService.logEvent('settings_clear_data');

    Get.dialog(CustomAlertDialog(
      title: S.current.settings_resetProgressDataDialogTitle,
      message: S.current.settings_resetProgressDataDialogMessage,
      positiveButtonText: S.current.settings_resetProgressButtonTitle,
      onPositivePressed: () {
        meditationService.clearMeditationData();
      },
    ));
  }

  void onFeedbackPressed() {
    Get.to(() => FeedbackDialog())?.then((value) {
      if (value != null) {
        showSnackbar(
          type: SnackbarType.success,
          message: S.current.feedback_submitMessageSnackbar,
        );
      }
    });
  }

  void onLogoutPressed() {
    firebaseService.logout().then((value) {
      showSnackbar(
        type: SnackbarType.success,
        message: S.current.logout_successMessage,
      );
      meditationService.clearMeditationData();
    });
  }

  void onScreenOnChanged(bool value) {
    storage.screenOn = value;
    notifyListeners();
  }

  void removeAllFriendsPressed() {
    firebaseService.logEvent('settings_disconnect_community');

    Get.dialog(CustomAlertDialog(
      title: S.current.communnity_disconnectDialogTitle,
      message: S.current.communnity_disconnectDialogMessage,
      positiveButtonText: S.current.communnity_disconnectDialogButton,
      onPositivePressed: () {
        getIt<CommunityService>().disconnect();
      },
    ));
  }

  void onEndingBellChanged(bool value) {
    storage.playEndingBell = value;
    notifyListeners();
  }
}
