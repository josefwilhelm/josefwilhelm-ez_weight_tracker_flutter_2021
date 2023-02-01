// ignore: unused_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ez_meditation_app/app/helper/timestamp_converter.dart';
import 'package:ez_meditation_app/app/models/session.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ez_user.freezed.dart';
part 'ez_user.g.dart';

@freezed
class EzUser with _$EzUser {
  @JsonSerializable(explicitToJson: true, anyMap: true)
  factory EzUser(
      {String? username,
      required String userId,
      String? email,
      String? photoUrl,
      String? dynamicLink,
      String? codeName,
      @Default([]) List<Session> sessions,
      @TimestampConverter() required DateTime created,
      @Default(false) bool isProUser,
      List<String>? friends}) = _EzUser;

  factory EzUser.fromJson(Map<String, dynamic> json) => _$EzUserFromJson(json);
}
