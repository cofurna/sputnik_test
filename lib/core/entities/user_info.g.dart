// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => UserInfo(
      login: json['login'] as String,
      company: json['company'] as String?,
      bio: json['bio'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      id: json['id'] as int,
      avatarUrl: json['avatar_url'] as String,
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'login': instance.login,
      'company': instance.company,
      'bio': instance.bio,
      'email': instance.email,
      'name': instance.name,
      'id': instance.id,
      'avatar_url': instance.avatarUrl,
    };
