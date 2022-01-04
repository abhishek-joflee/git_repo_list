import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/repo.dart';
import '../data/repository/repo_repository.dart';
import '../utils/my_hive_constants.dart';

class RepoController {
  final RepoRepository repoRepository = RepoRepository();
  final Box<Repo> repoBox = Hive.box(repoBoxName);
  final Box utilsBox = Hive.box(utilsBoxName);

  /// it fetches repos & add repo object to hive box
  Future<void> fetchRepos() async {
    // GET LAST FETCHED PAGE COUNT
    int lastPageCount = utilsBox.get(lastFetchedPageName, defaultValue: -1);
    List<Repo> repos = await repoRepository.getRepos(lastPageCount + 1);

    // STORE LAST FETCHED PAGE COUNT
    utilsBox.put(lastFetchedPageName, lastPageCount);

    // NO NEED AWAIT BUT JUST IN CASE
    await repoBox.addAll(repos);
  }
}
