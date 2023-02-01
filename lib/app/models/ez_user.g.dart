// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ez_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_EzUser _$_$_EzUserFromJson(Map json) {
  return _$_EzUser(
    username: json['username'] as String?,
    userId: json['userId'] as String,
    email: json['email'] as String?,
    photoUrl: json['photoUrl'] as String?,
    dynamicLink: json['dynamicLink'] as String?,
    codeName: json['codeName'] as String?,
    sessions: (json['sessions'] as List<dynamic>?)
            ?.map((e) => Session.fromJson(Map<String, dynamic>.from(e as Map)))
            .toList() ??
        [],
    created: const TimestampConverter().fromJson(json['created'] as Timestamp),
    isProUser: json['isProUser'] as bool? ?? false,
    friends:
        (json['friends'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_EzUserToJson(_$_EzUser instance) => <String, dynamic>{
      'username': instance.username,
      'userId': instance.userId,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'dynamicLink': instance.dynamicLink,
      'codeName': instance.codeName,
      'sessions': instance.sessions.map((e) => e.toJson()).toList(),
      'created': const TimestampConverter().toJson(instance.created),
      'isProUser': instance.isProUser,
      'friends': instance.friends,
    };
