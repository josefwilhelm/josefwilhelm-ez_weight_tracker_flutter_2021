// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionTypeAdapter extends TypeAdapter<SessionType> {
  @override
  final int typeId = 2;

  @override
  SessionType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return SessionType.timer;
      case 1:
        return SessionType.session_log;
      default:
        return SessionType.timer;
    }
  }

  @override
  void write(BinaryWriter writer, SessionType obj) {
    switch (obj) {
      case SessionType.timer:
        writer.writeByte(0);
        break;
      case SessionType.session_log:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SessionAdapter extends TypeAdapter<_$_Session> {
  @override
  final int typeId = 1;

  @override
  _$_Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Session(
      dateTime: fields[0] as DateTime,
      durationInSeconds: fields[1] as int,
      sessionType: fields[2] as SessionType?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Session obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.dateTime)
      ..writeByte(1)
      ..write(obj.durationInSeconds)
      ..writeByte(2)
      ..write(obj.sessionType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Session _$_$_SessionFromJson(Map json) {
  return _$_Session(
    dateTime:
        const TimestampConverter().fromJson(json['dateTime'] as Timestamp),
    durationInSeconds: json['durationInSeconds'] as int,
    sessionType:
        _$enumDecodeNullable(_$SessionTypeEnumMap, json['sessionType']),
  );
}

Map<String, dynamic> _$_$_SessionToJson(_$_Session instance) =>
    <String, dynamic>{
      'dateTime': const TimestampConverter().toJson(instance.dateTime),
      'durationInSeconds': instance.durationInSeconds,
      'sessionType': _$SessionTypeEnumMap[instance.sessionType],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SessionTypeEnumMap = {
  SessionType.timer: 'timer',
  SessionType.session_log: 'session_log',
};
