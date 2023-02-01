// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Statistics _$_$_StatisticsFromJson(Map json) {
  return _$_Statistics(
    currentStreak: json['currentStreak'] as int? ?? 0,
    maxStreak: json['maxStreak'] as int? ?? 0,
    averageSession: json['averageSession'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_StatisticsToJson(_$_Statistics instance) =>
    <String, dynamic>{
      'currentStreak': instance.currentStreak,
      'maxStreak': instance.maxStreak,
      'averageSession': instance.averageSession,
    };
