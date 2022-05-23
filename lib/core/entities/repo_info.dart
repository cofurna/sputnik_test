import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'repo_info.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class RepoInfo extends Equatable {
  const RepoInfo({
    required this.id,
    required this.forksCount,
    required this.stargazersCount,
    required this.name,
    required this.language,
  });

  factory RepoInfo.fromJson(Map<String, dynamic> json) =>
      _$RepoInfoFromJson(json);

  final int id;
  final int forksCount;
  final int stargazersCount;
  final String name;
  final String? language;

  static List<RepoInfo> fromJsonList(dynamic json) {
    return json
        .map((element) => RepoInfo.fromJson(element))
        .toList()
        .cast<RepoInfo>();
  }

  @override
  List<Object> get props => [id];
}
