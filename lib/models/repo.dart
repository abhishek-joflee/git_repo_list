class Repo {
  String id;
  String name;
  String description;
  String language;
  int openIssuesCount;
  int starCount;

  Repo({
    required this.id,
    required this.name,
    required this.description,
    required this.language,
    required this.openIssuesCount,
    required this.starCount,
  });
}
