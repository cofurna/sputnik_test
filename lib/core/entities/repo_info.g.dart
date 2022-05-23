// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoInfo _$RepoInfoFromJson(Map<String, dynamic> json) => RepoInfo(
      id: json['id'] as int,
      forksCount: json['forks_count'] as int,
      stargazersCount: json['stargazers_count'] as int,
      name: json['name'] as String,
      language: json['language'] as String?,
    );

Map<String, dynamic> _$RepoInfoToJson(RepoInfo instance) => <String, dynamic>{
      'id': instance.id,
      'forks_count': instance.forksCount,
      'stargazers_count': instance.stargazersCount,
      'name': instance.name,
      'language': instance.language,
    };
