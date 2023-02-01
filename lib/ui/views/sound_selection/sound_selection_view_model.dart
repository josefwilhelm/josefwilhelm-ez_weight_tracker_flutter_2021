import 'package:ez_meditation_app/app/core/custom_base_view_model.dart';
import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/sound.dart';
import 'package:ez_meditation_app/app/services/sound_service.dart';
import 'package:ez_meditation_app/app/sounds_config.dart';
import 'package:just_audio/just_audio.dart';

class SoundSelectionViewModel extends CustomBaseViewModel {
  final _soundService = getIt<SoundService>();
  late Sound selectedSound;

  List<Sound> get sounds => soundService.sounds;

  Future<void> init() async {
    selectedSound = soundService.sounds[storage.selectedSoundIndex];
  }

  AudioPlayer get player => _soundService.player;

  Future<void> onSoundPressed(Sound sound, int index) async {
    _soundService.stop();
    storage.selectedSoundIndex = index;
    selectedSound = sound;

    await sound.when(
      (name, _, downloadUrl) async {
        logger.i('sound: $name selected - downloadUrl: $downloadUrl');
        setBusy(true);
        await _soundService.getFile(downloadUrl).then((value) {
          _soundService.playSound(value);

          logger.i('file: ${value.path}');
        }).catchError((e) {
          logger.e(e);
        });
        setBusy(false);
      },
      empty: (name) {
        logger.i('sound: $name selected');

        _soundService.stop();
      },
    );
    notifyListeners();
  }

  @override
  void dispose() {
    _soundService.stop();
    super.dispose();
  }
}
