// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'statistics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Statistics _$StatisticsFromJson(Map<String, dynamic> json) {
  return _Statistics.fromJson(json);
}

/// @nodoc
class _$StatisticsTearOff {
  const _$StatisticsTearOff();

  _Statistics call(
      {int currentStreak = 0, int maxStreak = 0, int averageSession = 0}) {
    return _Statistics(
      currentStreak: currentStreak,
      maxStreak: maxStreak,
      averageSession: averageSession,
    );
  }

  Statistics fromJson(Map<String, Object> json) {
    return Statistics.fromJson(json);
  }
}

/// @nodoc
const $Statistics = _$StatisticsTearOff();

/// @nodoc
mixin _$Statistics {
  int get currentStreak => throw _privateConstructorUsedError;
  int get maxStreak => throw _privateConstructorUsedError;
  int get averageSession => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $StatisticsCopyWith<Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsCopyWith<$Res> {
  factory $StatisticsCopyWith(
          Statistics value, $Res Function(Statistics) then) =
      _$StatisticsCopyWithImpl<$Res>;
  $Res call({int currentStreak, int maxStreak, int averageSession});
}

/// @nodoc
class _$StatisticsCopyWithImpl<$Res> implements $StatisticsCopyWith<$Res> {
  _$StatisticsCopyWithImpl(this._value, this._then);

  final Statistics _value;
  // ignore: unused_field
  final $Res Function(Statistics) _then;

  @override
  $Res call({
    Object? currentStreak = freezed,
    Object? maxStreak = freezed,
    Object? averageSession = freezed,
  }) {
    return _then(_value.copyWith(
      currentStreak: currentStreak == freezed
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreak: maxStreak == freezed
          ? _value.maxStreak
          : maxStreak // ignore: cast_nullable_to_non_nullable
              as int,
      averageSession: averageSession == freezed
          ? _value.averageSession
          : averageSession // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$StatisticsCopyWith<$Res> implements $StatisticsCopyWith<$Res> {
  factory _$StatisticsCopyWith(
          _Statistics value, $Res Function(_Statistics) then) =
      __$StatisticsCopyWithImpl<$Res>;
  @override
  $Res call({int currentStreak, int maxStreak, int averageSession});
}

/// @nodoc
class __$StatisticsCopyWithImpl<$Res> extends _$StatisticsCopyWithImpl<$Res>
    implements _$StatisticsCopyWith<$Res> {
  __$StatisticsCopyWithImpl(
      _Statistics _value, $Res Function(_Statistics) _then)
      : super(_value, (v) => _then(v as _Statistics));

  @override
  _Statistics get _value => super._value as _Statistics;

  @override
  $Res call({
    Object? currentStreak = freezed,
    Object? maxStreak = freezed,
    Object? averageSession = freezed,
  }) {
    return _then(_Statistics(
      currentStreak: currentStreak == freezed
          ? _value.currentStreak
          : currentStreak // ignore: cast_nullable_to_non_nullable
              as int,
      maxStreak: maxStreak == freezed
          ? _value.maxStreak
          : maxStreak // ignore: cast_nullable_to_non_nullable
              as int,
      averageSession: averageSession == freezed
          ? _value.averageSession
          : averageSession // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$_Statistics implements _Statistics {
  _$_Statistics(
      {this.currentStreak = 0, this.maxStreak = 0, this.averageSession = 0});

  factory _$_Statistics.fromJson(Map<String, dynamic> json) =>
      _$_$_StatisticsFromJson(json);

  @JsonKey(defaultValue: 0)
  @override
  final int currentStreak;
  @JsonKey(defaultValue: 0)
  @override
  final int maxStreak;
  @JsonKey(defaultValue: 0)
  @override
  final int averageSession;

  @override
  String toString() {
    return 'Statistics(currentStreak: $currentStreak, maxStreak: $maxStreak, averageSession: $averageSession)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Statistics &&
            (identical(other.currentStreak, currentStreak) ||
                const DeepCollectionEquality()
                    .equals(other.currentStreak, currentStreak)) &&
            (identical(other.maxStreak, maxStreak) ||
                const DeepCollectionEquality()
                    .equals(other.maxStreak, maxStreak)) &&
            (identical(other.averageSession, averageSession) ||
                const DeepCollectionEquality()
                    .equals(other.averageSession, averageSession)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(currentStreak) ^
      const DeepCollectionEquality().hash(maxStreak) ^
      const DeepCollectionEquality().hash(averageSession);

  @JsonKey(ignore: true)
  @override
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      __$StatisticsCopyWithImpl<_Statistics>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_StatisticsToJson(this);
  }
}

abstract class _Statistics implements Statistics {
  factory _Statistics({int currentStreak, int maxStreak, int averageSession}) =
      _$_Statistics;

  factory _Statistics.fromJson(Map<String, dynamic> json) =
      _$_Statistics.fromJson;

  @override
  int get currentStreak => throw _privateConstructorUsedError;
  @override
  int get maxStreak => throw _privateConstructorUsedError;
  @override
  int get averageSession => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$StatisticsCopyWith<_Statistics> get copyWith =>
      throw _privateConstructorUsedError;
}
