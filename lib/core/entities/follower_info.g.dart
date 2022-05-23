// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'follower_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FollowerInfo _$FollowerInfoFromJson(Map<String, dynamic> json) => FollowerInfo(
      id: json['id'] as int,
      login: json['login'] as String,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$FollowerInfoToJson(FollowerInfo instance) =>
    <String, dynamic>{
      'id': instance.id,
      'login': instance.login,
      'avatar_url': instance.avatarUrl,
    };
