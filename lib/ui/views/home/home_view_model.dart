import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/sounds_config.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:ez_meditation_app/ui/views/meditation/meditation_view.dart';
import 'package:ez_meditation_app/ui/views/profile/profile_view.dart';
import 'package:ez_meditation_app/ui/views/settings/settings_view.dart';
import 'package:ez_meditation_app/ui/views/sound_selection/sound_selection_view.dart';
import 'package:get/get.dart';

class HomeViewModel extends CustomBaseViewModel {
  var duration;

  String get selectedSound =>
      soundService.sounds[storage.selectedSoundIndex].name;

  void init() {
    duration = storage.timerDuration;
  }

  void onProfilePressed() {
    Get.to(() => ProfileView());
  }

  void onSettingsPressed() {
    Get.to(() => SettingsView());
  }

  Future<void> onTimerSettingsPressed() async {
    logger.i('onTimerSettingsPressed: ');
  }

  Future<void> onBackgroundSoundPressed() async {
    await Get.to(() => SoundSelectionView());
    notifyListeners();
    logger.i('onBackgroundSoundPressed');
  }

  void onGongPressed() {
    logger.i('onBackgroundSoundPressed');
  }

  void onTimerSettingsChanged(Duration? time) {
    if (time != null) {
      if (time.inMinutes < 1) {
        showSnackbar(message: S.current.snackbar_minSessionLengthInfo);
        return;
      }
      duration = time;
      storage.timerDuration = time;
      notifyListeners();
    }
  }

  void onStartPressed() {
    Get.to(() => MeditationView());
  }
}
