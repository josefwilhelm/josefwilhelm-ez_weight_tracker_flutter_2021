import 'package:ez_meditation_app/app/locator.dart';
import 'package:ez_meditation_app/app/models/sound.dart';
import 'package:ez_meditation_app/app/services/storage_service.dart';
import 'package:ez_meditation_app/app/sounds_config.dart';
import 'package:ez_meditation_app/app/utils/logger.dart';
import 'package:file/src/interface/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:just_audio/just_audio.dart';

class SoundService {
  final _logger = getLogger('SoundService');
  final storage = getIt<StorageService>();

  List<Sound> sounds = [];

  final player = AudioPlayer();
  final _bellPlayer = AudioPlayer();

  SoundService() {
    sounds = sounds1
      ..insert(
        0,
        EmptySound('No Sound'), //TODO
      );
    _logger.i('created');

    setFilePathOfFile(index: storage.selectedSoundIndex);
    player.setLoopMode(LoopMode.all);
  }

  Future<File> getFile(String url) {
    return DefaultCacheManager().getSingleFile(url);
  }

  void stop() {
    player.pause();
    // _bellPlayer.pause();
  }

  void playSound(File file) {
    player.pause();
    player.setFilePath(file.path);
    player.play();
  }

  void setToNoSound() {}

  void setFilePathOfFile({required int index}) {
    final sound = sounds[index];
    sound.when((name, _, downloadUrl) async {
      final file = await getFile(downloadUrl);
      _logger.i('audio set to $name - path: ${file.path}');
      await player.setFilePath(file.path);
    }, empty: (name) {
      _logger.i('audio set to $name: ');
    });
  }

  void playCurrentlySelectedSound() {
    if (storage.selectedSoundIndex != 0) {
      player.play();
    }
  }

  void playEndingBell() {
    _bellPlayer.setAsset('assets/bell.mp3');
    _bellPlayer.play();
  }
}
