import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserInfo extends Equatable {
  const UserInfo({
    required this.login,
    required this.company,
    required this.bio,
    required this.email,
    required this.name,
    required this.id,
    required this.avatarUrl,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);

  final String login;
  final String? company;
  final String? bio;
  final String? email;
  final String? name;
  final int id;
  final String avatarUrl;

  @override
  List<Object> get props => [id];
}
