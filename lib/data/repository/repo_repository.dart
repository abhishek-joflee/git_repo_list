import '../dataproviders/repo_api.dart';
import '../models/repo.dart';

class RepoRepository {
  final RepoAPI repoAPI = RepoAPI();

  Future<List<Repo>> getRepos(int pageCount) async {
    List<Repo> result = [];
    var rawRepos = await repoAPI.getRawRepos(pageCount);

    if (rawRepos != null) {
      // CONVERT RAW JSON INTO REPO OBJECT
      for (var rawRepo in rawRepos) {
        result.add(Repo.fromJson(rawRepo));
      }
    }

    // RETURN THE LIST OF REPO
    return result;
  }
}
