import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/ui/dialog/custom_alert_dialog.dart';
import 'package:get/get.dart';

class FinishViewModel extends CustomBaseViewModel {
  Future<void> init() async {
    if (storage.playEndingBell) {
      getIt<SoundService>().playEndingBell();
    }
  }

  Session get lastSession => meditationService.lastSession!;

  void onDiscardPressed() {
    Get.dialog(CustomAlertDialog(
      title: S.current.finish_discardDialogTitle,
      message: S.current.finish_discardDialogMessage,
      onPositivePressed: () {
        meditationService.discardLastSession();
        firebaseService.logEvent('session_discarded');
        Get.back();
      },
    ));
  }
}
