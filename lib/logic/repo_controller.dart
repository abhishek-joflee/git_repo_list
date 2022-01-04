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
    // GET LAST FETCHED PAGE COUNT & GET ALL REPOS
    int pageCount = utilsBox.get(lastFetchedPageName, defaultValue: 0);
    List<Repo> repos = await repoRepository.getRepos(pageCount);

    // STORE LAST FETCHED PAGE COUNT
    await utilsBox.put(lastFetchedPageName, pageCount + 1);

    // ADD ALL REPOS TO REPO BOX
    await repoBox.addAll(repos);
    return;
  }
}
