import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/models/repo.dart';
import '../data/repository/repo_repository.dart';
import '../utils/my_hive_constants.dart';

class RepoController {
  final RepoRepository repoRepository = RepoRepository();
  final Box<Repo> repoBox = Hive.box(repoBoxName);
  final Box utilsBox = Hive.box(utilsBoxName);

  bool _allLoaded = false;
  bool? isOffline;

  static var _obj = RepoController();

  static RepoController get instance => _obj;

  /// it fetches repos & add repo object to hive box
  Future<void> fetchRepos() async {
    if (isOffline == null) {
      // set offline bool
      ConnectivityResult result = await Connectivity().checkConnectivity();
      if (result == ConnectivityResult.none) {
        isOffline = true;
      } else {
        isOffline = false;
      }
    }

    if (isOffline! || _allLoaded) {
      return;
    }

    // GET LAST FETCHED PAGE COUNT & GET ALL REPOS
    int pageCount = utilsBox.get(lastFetchedPageName, defaultValue: 1);
    List<Repo>? repos = await repoRepository.getRepos(pageCount);

    if (repos != null) {
      if (repos.length < 15) {
        // ALL REPO LOADED
        _allLoaded = true;
      }

      // STORE LAST PAGE COUNT & REPOS
      await utilsBox.put(lastFetchedPageName, pageCount + 1);
      await repoBox.addAll(repos);
    }
    return;
  }
}
