import 'package:freezed_annotation/freezed_annotation.dart';

part 'sound.freezed.dart';
part 'sound.g.dart';

@freezed
class Sound with _$Sound {
  const factory Sound({
    required String name,
    required String fileName,
    required String downloadUrl,
  }) = _Sound;

  // factory Sound.empty() = 'asdf';

  factory Sound.fromJson(Map<String, dynamic> json) => _$SoundFromJson(json);
  factory Sound.empty(String name) = EmptySound;
}
