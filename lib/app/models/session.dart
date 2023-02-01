import 'package:ez_meditation_app/app/helper/timestamp_converter.dart';
import 'package:ez_meditation_app/generated/l10n.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@HiveType(typeId: 2, adapterName: 'SessionTypeAdapter')
enum SessionType {
  @HiveField(0)
  timer,
  @HiveField(1)
  session_log,
}

extension Name on SessionType {
  String get name => describeEnum(this);

  String get translation {
    switch (this) {
      case SessionType.timer:
        return S.current.sessionLog_entryTypeTimer;
      case SessionType.session_log:
        return S.current.sessionLog_entryTypeSessionLog;
      default:
        return S.current.sessionLog_entryTypeTimer;
    }
  }
}

@freezed
class Session with _$Session {
  @HiveType(typeId: 1, adapterName: 'SessionAdapter')
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory Session({
    @TimestampConverter() @HiveField(0) required DateTime dateTime,
    @HiveField(1) required int durationInSeconds,
    @HiveField(2) required SessionType? sessionType,
  }) = _Session;

  factory Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);
}
