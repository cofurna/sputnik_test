import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'follower_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FollowerInfo extends Equatable {
  const FollowerInfo({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  factory FollowerInfo.fromJson(Map<String, dynamic> json) =>
      _$FollowerInfoFromJson(json);

  final int id;
  final String login;
  final String avatarUrl;

  static List<FollowerInfo> fromJsonList(dynamic json) {
    return json
        .map((element) => FollowerInfo.fromJson(element))
        .toList()
        .cast<FollowerInfo>();
  }

  @override
  List<Object> get props => [id];
}
