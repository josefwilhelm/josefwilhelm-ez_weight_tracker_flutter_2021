// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
class _$SessionTearOff {
  const _$SessionTearOff();

  _Session call(
      {@TimestampConverter() @HiveField(0) required DateTime dateTime,
      @HiveField(1) required int durationInSeconds,
      @HiveField(2) required SessionType? sessionType}) {
    return _Session(
      dateTime: dateTime,
      durationInSeconds: durationInSeconds,
      sessionType: sessionType,
    );
  }

  Session fromJson(Map<String, Object> json) {
    return Session.fromJson(json);
  }
}

/// @nodoc
const $Session = _$SessionTearOff();

/// @nodoc
mixin _$Session {
  @TimestampConverter()
  @HiveField(0)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @HiveField(1)
  int get durationInSeconds => throw _privateConstructorUsedError;
  @HiveField(2)
  SessionType? get sessionType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() @HiveField(0) DateTime dateTime,
      @HiveField(1) int durationInSeconds,
      @HiveField(2) SessionType? sessionType});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  final Session _value;
  // ignore: unused_field
  final $Res Function(Session) _then;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? durationInSeconds = freezed,
    Object? sessionType = freezed,
  }) {
    return _then(_value.copyWith(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInSeconds: durationInSeconds == freezed
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionType: sessionType == freezed
          ? _value.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType?,
    ));
  }
}

/// @nodoc
abstract class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) then) =
      __$SessionCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() @HiveField(0) DateTime dateTime,
      @HiveField(1) int durationInSeconds,
      @HiveField(2) SessionType? sessionType});
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> extends _$SessionCopyWithImpl<$Res>
    implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(_Session _value, $Res Function(_Session) _then)
      : super(_value, (v) => _then(v as _Session));

  @override
  _Session get _value => super._value as _Session;

  @override
  $Res call({
    Object? dateTime = freezed,
    Object? durationInSeconds = freezed,
    Object? sessionType = freezed,
  }) {
    return _then(_Session(
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      durationInSeconds: durationInSeconds == freezed
          ? _value.durationInSeconds
          : durationInSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      sessionType: sessionType == freezed
          ? _value.sessionType
          : sessionType // ignore: cast_nullable_to_non_nullable
              as SessionType?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: 'SessionAdapter')
@JsonSerializable(explicitToJson: true, anyMap: true)
class _$_Session with DiagnosticableTreeMixin implements _Session {
  _$_Session(
      {@TimestampConverter() @HiveField(0) required this.dateTime,
      @HiveField(1) required this.durationInSeconds,
      @HiveField(2) required this.sessionType});

  factory _$_Session.fromJson(Map<String, dynamic> json) =>
      _$_$_SessionFromJson(json);

  @override
  @TimestampConverter()
  @HiveField(0)
  final DateTime dateTime;
  @override
  @HiveField(1)
  final int durationInSeconds;
  @override
  @HiveField(2)
  final SessionType? sessionType;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Session(dateTime: $dateTime, durationInSeconds: $durationInSeconds, sessionType: $sessionType)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Session'))
      ..add(DiagnosticsProperty('dateTime', dateTime))
      ..add(DiagnosticsProperty('durationInSeconds', durationInSeconds))
      ..add(DiagnosticsProperty('sessionType', sessionType));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Session &&
            (identical(other.dateTime, dateTime) ||
                const DeepCollectionEquality()
                    .equals(other.dateTime, dateTime)) &&
            (identical(other.durationInSeconds, durationInSeconds) ||
                const DeepCollectionEquality()
                    .equals(other.durationInSeconds, durationInSeconds)) &&
            (identical(other.sessionType, sessionType) ||
                const DeepCollectionEquality()
                    .equals(other.sessionType, sessionType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(dateTime) ^
      const DeepCollectionEquality().hash(durationInSeconds) ^
      const DeepCollectionEquality().hash(sessionType);

  @JsonKey(ignore: true)
  @override
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SessionToJson(this);
  }
}

abstract class _Session implements Session {
  factory _Session(
      {@TimestampConverter() @HiveField(0) required DateTime dateTime,
      @HiveField(1) required int durationInSeconds,
      @HiveField(2) required SessionType? sessionType}) = _$_Session;

  factory _Session.fromJson(Map<String, dynamic> json) = _$_Session.fromJson;

  @override
  @TimestampConverter()
  @HiveField(0)
  DateTime get dateTime => throw _privateConstructorUsedError;
  @override
  @HiveField(1)
  int get durationInSeconds => throw _privateConstructorUsedError;
  @override
  @HiveField(2)
  SessionType? get sessionType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SessionCopyWith<_Session> get copyWith =>
      throw _privateConstructorUsedError;
}
