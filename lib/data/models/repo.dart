import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Repo extends HiveObject {
  Repo({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.openIssuesCount,
    required this.starCount,
  });

  @HiveField(0)
  @JsonKey(name: 'id')
  int id;

  @HiveField(1)
  @JsonKey(name: 'name')
  String name;

  @HiveField(2)
  @JsonKey(name: 'description')
  String? description;

  @HiveField(3)
  @JsonKey(name: 'language')
  String? language;

  @HiveField(4)
  @JsonKey(name: 'open_issues_count')
  int openIssuesCount;

  @HiveField(5)
  @JsonKey(name: 'stargazers_count')
  int starCount;

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);
}
