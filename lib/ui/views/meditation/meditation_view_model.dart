import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/services/meditation_service.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/app/utils.dart';
import 'package:ez_meditation_app/styles.dart';
import 'package:ez_meditation_app/ui/views/finish/finish_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:get/get.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:wakelock/wakelock.dart';

class MeditationViewModel extends CustomBaseViewModel {
  final _meditationService = getIt<MeditationService>();
  final _soundService = getIt<SoundService>();

  Duration get warmUpDuration => Duration(seconds: 5);
  Duration get duration => storage.timerDuration;
  CountDownController meditationTimeController = CountDownController();
  CountdownController warmUpController = CountdownController();

  bool isWarmupDone = false;
  bool isPaused = false;

  Future<void> init() async {
    await FlutterStatusbarcolor.setStatusBarColor(jetBlack);
    if (storage.screenOn) {
      await Wakelock.enable();
    }

    warmUpController.start();
    notifyListeners();
  }

  @override
  Future<void> dispose() async {
    await FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    _soundService.stop();
    await Wakelock.disable();

    super.dispose();
  }

  Future<void> onWarmupFinished() async {
    firebaseService.logEvent('meditation_start',
        parameters: {'_duration': duration.inSeconds});
    isWarmupDone = true;
    notifyListeners();
    logger.i('warmupDone: $isWarmupDone');
    await Future.delayed(Duration(milliseconds: 300));
    _soundService.playCurrentlySelectedSound();
    // meditationTimeController.start();
    logger.i(
        'meditationTimeController started - ${prettySessionDuration(duration.inSeconds)}');

    notifyListeners();
  }

  void onMeditationTimerFinished() {
    final mediationDuration = _getDurationInSeconds();
    _meditationService.saveSession(_getDurationInSeconds());
    firebaseService.logEvent('meditation_finished',
        parameters: {'_duration': mediationDuration});
    Get.off(() => FinishView());
  }

  void togglePause() {
    isPaused = !isPaused;
    firebaseService
        .logEvent('meditation_toggle_paused', parameters: {'state': isPaused});
    if (isPaused) {
      _soundService.stop();
      meditationTimeController.pause();
    } else {
      _soundService.playCurrentlySelectedSound();

      meditationTimeController.resume();
    }
    notifyListeners();
  }

  int _getDurationInSeconds() {
    try {
      final remainingTime = meditationTimeController.getTime() ?? '00:00';
      final split = remainingTime.split(':');
      var hours = int.parse(split[0]) * 60 * 60;
      var minutes = int.parse(split[1]) * 60;
      var seconds = int.parse(split[2]);

      return duration.inSeconds - hours - minutes - seconds;
    } catch (e) {
      logger.e('something went wrong while parsing time: e');
    }
    return 0;
  }
}
