import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/repo.dart';
import '../data/repository/repo_repository.dart';

class RepoController {
  final RepoRepository repoRepository = RepoRepository();
  final Box<Repo> repoBox = Hive.box('repo');
  Future<void> fetchRepos() async {
    List<Repo> repos = await repoRepository.getRepos(0);

    // no need await but just in case
    await repoBox.addAll(repos);
  }
}
