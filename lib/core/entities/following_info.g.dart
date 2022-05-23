// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowingInfo _$FollowingInfoFromJson(Map<String, dynamic> json) =>
    FollowingInfo(
      id: json['id'] as int,
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$FollowingInfoToJson(FollowingInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
