// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'ez_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

EzUser _$EzUserFromJson(Map<String, dynamic> json) {
  return _EzUser.fromJson(json);
}

/// @nodoc
class _$EzUserTearOff {
  const _$EzUserTearOff();

  _EzUser call(
      {String? username,
      required String userId,
      String? email,
      String? photoUrl,
      String? dynamicLink,
      String? codeName,
      List<Session> sessions = const [],
      @TimestampConverter() required DateTime created,
      bool isProUser = false,
      List<String>? friends}) {
    return _EzUser(
      username: username,
      userId: userId,
      email: email,
      photoUrl: photoUrl,
      dynamicLink: dynamicLink,
      codeName: codeName,
      sessions: sessions,
      created: created,
      isProUser: isProUser,
      friends: friends,
    );
  }

  EzUser fromJson(Map<String, Object> json) {
    return EzUser.fromJson(json);
  }
}

/// @nodoc
const $EzUser = _$EzUserTearOff();

/// @nodoc
mixin _$EzUser {
  String? get username => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get photoUrl => throw _privateConstructorUsedError;
  String? get dynamicLink => throw _privateConstructorUsedError;
  String? get codeName => throw _privateConstructorUsedError;
  List<Session> get sessions => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get created => throw _privateConstructorUsedError;
  bool get isProUser => throw _privateConstructorUsedError;
  List<String>? get friends => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EzUserCopyWith<EzUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EzUserCopyWith<$Res> {
  factory $EzUserCopyWith(EzUser value, $Res Function(EzUser) then) =
      _$EzUserCopyWithImpl<$Res>;
  $Res call(
      {String? username,
      String userId,
      String? email,
      String? photoUrl,
      String? dynamicLink,
      String? codeName,
      List<Session> sessions,
      @TimestampConverter() DateTime created,
      bool isProUser,
      List<String>? friends});
}

/// @nodoc
class _$EzUserCopyWithImpl<$Res> implements $EzUserCopyWith<$Res> {
  _$EzUserCopyWithImpl(this._value, this._then);

  final EzUser _value;
  // ignore: unused_field
  final $Res Function(EzUser) _then;

  @override
  $Res call({
    Object? username = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? dynamicLink = freezed,
    Object? codeName = freezed,
    Object? sessions = freezed,
    Object? created = freezed,
    Object? isProUser = freezed,
    Object? friends = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dynamicLink: dynamicLink == freezed
          ? _value.dynamicLink
          : dynamicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      codeName: codeName == freezed
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String?,
      sessions: sessions == freezed
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isProUser: isProUser == freezed
          ? _value.isProUser
          : isProUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
abstract class _$EzUserCopyWith<$Res> implements $EzUserCopyWith<$Res> {
  factory _$EzUserCopyWith(_EzUser value, $Res Function(_EzUser) then) =
      __$EzUserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? username,
      String userId,
      String? email,
      String? photoUrl,
      String? dynamicLink,
      String? codeName,
      List<Session> sessions,
      @TimestampConverter() DateTime created,
      bool isProUser,
      List<String>? friends});
}

/// @nodoc
class __$EzUserCopyWithImpl<$Res> extends _$EzUserCopyWithImpl<$Res>
    implements _$EzUserCopyWith<$Res> {
  __$EzUserCopyWithImpl(_EzUser _value, $Res Function(_EzUser) _then)
      : super(_value, (v) => _then(v as _EzUser));

  @override
  _EzUser get _value => super._value as _EzUser;

  @override
  $Res call({
    Object? username = freezed,
    Object? userId = freezed,
    Object? email = freezed,
    Object? photoUrl = freezed,
    Object? dynamicLink = freezed,
    Object? codeName = freezed,
    Object? sessions = freezed,
    Object? created = freezed,
    Object? isProUser = freezed,
    Object? friends = freezed,
  }) {
    return _then(_EzUser(
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      photoUrl: photoUrl == freezed
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      dynamicLink: dynamicLink == freezed
          ? _value.dynamicLink
          : dynamicLink // ignore: cast_nullable_to_non_nullable
              as String?,
      codeName: codeName == freezed
          ? _value.codeName
          : codeName // ignore: cast_nullable_to_non_nullable
              as String?,
      sessions: sessions == freezed
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      created: created == freezed
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isProUser: isProUser == freezed
          ? _value.isProUser
          : isProUser // ignore: cast_nullable_to_non_nullable
              as bool,
      friends: friends == freezed
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true, anyMap: true)
class _$_EzUser with DiagnosticableTreeMixin implements _EzUser {
  _$_EzUser(
      {this.username,
      required this.userId,
      this.email,
      this.photoUrl,
      this.dynamicLink,
      this.codeName,
      this.sessions = const [],
      @TimestampConverter() required this.created,
      this.isProUser = false,
      this.friends});

  factory _$_EzUser.fromJson(Map<String, dynamic> json) =>
      _$_$_EzUserFromJson(json);

  @override
  final String? username;
  @override
  final String userId;
  @override
  final String? email;
  @override
  final String? photoUrl;
  @override
  final String? dynamicLink;
  @override
  final String? codeName;
  @JsonKey(defaultValue: const [])
  @override
  final List<Session> sessions;
  @override
  @TimestampConverter()
  final DateTime created;
  @JsonKey(defaultValue: false)
  @override
  final bool isProUser;
  @override
  final List<String>? friends;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'EzUser(username: $username, userId: $userId, email: $email, photoUrl: $photoUrl, dynamicLink: $dynamicLink, codeName: $codeName, sessions: $sessions, created: $created, isProUser: $isProUser, friends: $friends)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'EzUser'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('userId', userId))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('dynamicLink', dynamicLink))
      ..add(DiagnosticsProperty('codeName', codeName))
      ..add(DiagnosticsProperty('sessions', sessions))
      ..add(DiagnosticsProperty('created', created))
      ..add(DiagnosticsProperty('isProUser', isProUser))
      ..add(DiagnosticsProperty('friends', friends));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EzUser &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.photoUrl, photoUrl) ||
                const DeepCollectionEquality()
                    .equals(other.photoUrl, photoUrl)) &&
            (identical(other.dynamicLink, dynamicLink) ||
                const DeepCollectionEquality()
                    .equals(other.dynamicLink, dynamicLink)) &&
            (identical(other.codeName, codeName) ||
                const DeepCollectionEquality()
                    .equals(other.codeName, codeName)) &&
            (identical(other.sessions, sessions) ||
                const DeepCollectionEquality()
                    .equals(other.sessions, sessions)) &&
            (identical(other.created, created) ||
                const DeepCollectionEquality()
                    .equals(other.created, created)) &&
            (identical(other.isProUser, isProUser) ||
                const DeepCollectionEquality()
                    .equals(other.isProUser, isProUser)) &&
            (identical(other.friends, friends) ||
                const DeepCollectionEquality().equals(other.friends, friends)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(photoUrl) ^
      const DeepCollectionEquality().hash(dynamicLink) ^
      const DeepCollectionEquality().hash(codeName) ^
      const DeepCollectionEquality().hash(sessions) ^
      const DeepCollectionEquality().hash(created) ^
      const DeepCollectionEquality().hash(isProUser) ^
      const DeepCollectionEquality().hash(friends);

  @JsonKey(ignore: true)
  @override
  _$EzUserCopyWith<_EzUser> get copyWith =>
      __$EzUserCopyWithImpl<_EzUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_EzUserToJson(this);
  }
}

abstract class _EzUser implements EzUser {
  factory _EzUser(
      {String? username,
      required String userId,
      String? email,
      String? photoUrl,
      String? dynamicLink,
      String? codeName,
      List<Session> sessions,
      @TimestampConverter() required DateTime created,
      bool isProUser,
      List<String>? friends}) = _$_EzUser;

  factory _EzUser.fromJson(Map<String, dynamic> json) = _$_EzUser.fromJson;

  @override
  String? get username => throw _privateConstructorUsedError;
  @override
  String get userId => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get photoUrl => throw _privateConstructorUsedError;
  @override
  String? get dynamicLink => throw _privateConstructorUsedError;
  @override
  String? get codeName => throw _privateConstructorUsedError;
  @override
  List<Session> get sessions => throw _privateConstructorUsedError;
  @override
  @TimestampConverter()
  DateTime get created => throw _privateConstructorUsedError;
  @override
  bool get isProUser => throw _privateConstructorUsedError;
  @override
  List<String>? get friends => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$EzUserCopyWith<_EzUser> get copyWith => throw _privateConstructorUsedError;
}
