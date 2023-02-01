// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sound _$_$_SoundFromJson(Map<String, dynamic> json) {
  return _$_Sound(
    name: json['name'] as String,
    fileName: json['fileName'] as String,
    downloadUrl: json['downloadUrl'] as String,
  );
}

Map<String, dynamic> _$_$_SoundToJson(_$_Sound instance) => <String, dynamic>{
      'name': instance.name,
      'fileName': instance.fileName,
      'downloadUrl': instance.downloadUrl,
    };

_$EmptySound _$_$EmptySoundFromJson(Map<String, dynamic> json) {
  return _$EmptySound(
    json['name'] as String,
  );
}

Map<String, dynamic> _$_$EmptySoundToJson(_$EmptySound instance) =>
    <String, dynamic>{
      'name': instance.name,
    };
