import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'following_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class FollowingInfo extends Equatable {
  const FollowingInfo({
    required this.id,
    required this.login,
    required this.avatarUrl,
  });

  factory FollowingInfo.fromJson(Map<String, dynamic> json) =>
      _$FollowingInfoFromJson(json);

  final int id;
  final String login;
  final String avatarUrl;

  static List<FollowingInfo> fromJsonList(dynamic json) {
    return json
        .map((element) => FollowingInfo.fromJson(element))
        .toList()
        .cast<FollowingInfo>();
  }

  @override
  List<Object> get props => [id];
}
