import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:ez_meditation_app/constants.dart';
import 'package:get_storage/get_storage.dart';

class StorageService {
  final _logger = getLogger('StorageService');

  final _box = GetStorage();

  StorageService() {
    _logger.i('created');

    _box.listen(() {
      print('written to storage');
    });
  }

  set notifications(bool value) => _box.write(SETTINGS_NOTIFICATIONS, value);
  bool get notifications => _box.read(SETTINGS_NOTIFICATIONS) ?? false;

  set screenOn(bool value) => _box.write(SETTINGS_SCREEN_ON, value);
  bool get screenOn => _box.read(SETTINGS_SCREEN_ON) ?? false;

  set playEndingBell(bool value) =>
      _box.write(SETTINGS_PLAY_ENDING_BELL, value);
  bool get playEndingBell => _box.read(SETTINGS_PLAY_ENDING_BELL) ?? true;

  set timerDuration(Duration value) =>
      _box.write(SETTINGS_TIMER_DURATION, value.inMilliseconds);

  Duration get timerDuration {
    final value = _box.read(SETTINGS_TIMER_DURATION);
    if (value != null) {
      return Duration(milliseconds: value);
    } else {
      return Duration(minutes: 10);
    }
  }

  set selectedSoundIndex(int index) =>
      _box.write(SETTINGS_SELECTED_SOUND, index);

  int get selectedSoundIndex => _box.read(SETTINGS_SELECTED_SOUND) ?? 0;
}
