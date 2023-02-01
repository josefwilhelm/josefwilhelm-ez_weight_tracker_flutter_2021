// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sound.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sound _$SoundFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'default':
      return _Sound.fromJson(json);
    case 'empty':
      return EmptySound.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$SoundTearOff {
  const _$SoundTearOff();

  _Sound call(
      {required String name,
      required String fileName,
      required String downloadUrl}) {
    return _Sound(
      name: name,
      fileName: fileName,
      downloadUrl: downloadUrl,
    );
  }

  EmptySound empty(String name) {
    return EmptySound(
      name,
    );
  }

  Sound fromJson(Map<String, Object> json) {
    return Sound.fromJson(json);
  }
}

/// @nodoc
const $Sound = _$SoundTearOff();

/// @nodoc
mixin _$Sound {
  String get name => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)
        $default, {
    required TResult Function(String name) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)?
        $default, {
    TResult Function(String name)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sound value) $default, {
    required TResult Function(EmptySound value) empty,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sound value)? $default, {
    TResult Function(EmptySound value)? empty,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SoundCopyWith<Sound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SoundCopyWith<$Res> {
  factory $SoundCopyWith(Sound value, $Res Function(Sound) then) =
      _$SoundCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class _$SoundCopyWithImpl<$Res> implements $SoundCopyWith<$Res> {
  _$SoundCopyWithImpl(this._value, this._then);

  final Sound _value;
  // ignore: unused_field
  final $Res Function(Sound) _then;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$SoundCopyWith<$Res> implements $SoundCopyWith<$Res> {
  factory _$SoundCopyWith(_Sound value, $Res Function(_Sound) then) =
      __$SoundCopyWithImpl<$Res>;
  @override
  $Res call({String name, String fileName, String downloadUrl});
}

/// @nodoc
class __$SoundCopyWithImpl<$Res> extends _$SoundCopyWithImpl<$Res>
    implements _$SoundCopyWith<$Res> {
  __$SoundCopyWithImpl(_Sound _value, $Res Function(_Sound) _then)
      : super(_value, (v) => _then(v as _Sound));

  @override
  _Sound get _value => super._value as _Sound;

  @override
  $Res call({
    Object? name = freezed,
    Object? fileName = freezed,
    Object? downloadUrl = freezed,
  }) {
    return _then(_Sound(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: fileName == freezed
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: downloadUrl == freezed
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sound implements _Sound {
  const _$_Sound(
      {required this.name, required this.fileName, required this.downloadUrl});

  factory _$_Sound.fromJson(Map<String, dynamic> json) =>
      _$_$_SoundFromJson(json);

  @override
  final String name;
  @override
  final String fileName;
  @override
  final String downloadUrl;

  @override
  String toString() {
    return 'Sound(name: $name, fileName: $fileName, downloadUrl: $downloadUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Sound &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.fileName, fileName) ||
                const DeepCollectionEquality()
                    .equals(other.fileName, fileName)) &&
            (identical(other.downloadUrl, downloadUrl) ||
                const DeepCollectionEquality()
                    .equals(other.downloadUrl, downloadUrl)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(fileName) ^
      const DeepCollectionEquality().hash(downloadUrl);

  @JsonKey(ignore: true)
  @override
  _$SoundCopyWith<_Sound> get copyWith =>
      __$SoundCopyWithImpl<_Sound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)
        $default, {
    required TResult Function(String name) empty,
  }) {
    return $default(name, fileName, downloadUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)?
        $default, {
    TResult Function(String name)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(name, fileName, downloadUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sound value) $default, {
    required TResult Function(EmptySound value) empty,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sound value)? $default, {
    TResult Function(EmptySound value)? empty,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SoundToJson(this)..['runtimeType'] = 'default';
  }
}

abstract class _Sound implements Sound {
  const factory _Sound(
      {required String name,
      required String fileName,
      required String downloadUrl}) = _$_Sound;

  factory _Sound.fromJson(Map<String, dynamic> json) = _$_Sound.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SoundCopyWith<_Sound> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmptySoundCopyWith<$Res> implements $SoundCopyWith<$Res> {
  factory $EmptySoundCopyWith(
          EmptySound value, $Res Function(EmptySound) then) =
      _$EmptySoundCopyWithImpl<$Res>;
  @override
  $Res call({String name});
}

/// @nodoc
class _$EmptySoundCopyWithImpl<$Res> extends _$SoundCopyWithImpl<$Res>
    implements $EmptySoundCopyWith<$Res> {
  _$EmptySoundCopyWithImpl(EmptySound _value, $Res Function(EmptySound) _then)
      : super(_value, (v) => _then(v as EmptySound));

  @override
  EmptySound get _value => super._value as EmptySound;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(EmptySound(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EmptySound implements EmptySound {
  _$EmptySound(this.name);

  factory _$EmptySound.fromJson(Map<String, dynamic> json) =>
      _$_$EmptySoundFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Sound.empty(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmptySound &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  $EmptySoundCopyWith<EmptySound> get copyWith =>
      _$EmptySoundCopyWithImpl<EmptySound>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)
        $default, {
    required TResult Function(String name) empty,
  }) {
    return empty(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String name, String fileName, String downloadUrl)?
        $default, {
    TResult Function(String name)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sound value) $default, {
    required TResult Function(EmptySound value) empty,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sound value)? $default, {
    TResult Function(EmptySound value)? empty,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$EmptySoundToJson(this)..['runtimeType'] = 'empty';
  }
}

abstract class EmptySound implements Sound {
  factory EmptySound(String name) = _$EmptySound;

  factory EmptySound.fromJson(Map<String, dynamic> json) =
      _$EmptySound.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $EmptySoundCopyWith<EmptySound> get copyWith =>
      throw _privateConstructorUsedError;
}
