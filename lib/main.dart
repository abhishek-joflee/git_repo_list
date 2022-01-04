import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'data/models/repo.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter<Repo>(RepoAdapter());
  await Hive.openBox<Repo>('repo');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final Box<Repo> repoBox = Hive.box('repo');

  void _addRepo() {
    Map<String, dynamic> json = {
      "id": 3070104,
      "node_id": "MDEwOlJlcG9zaXRvcnkzMDcwMTA0",
      "name": "abs.io",
      "full_name": "JakeWharton/abs.io",
      "private": false,
      "owner": {
        "login": "JakeWharton",
        "id": 66577,
        "node_id": "MDQ6VXNlcjY2NTc3",
        "avatar_url": "https://avatars.githubusercontent.com/u/66577?v=4",
        "gravatar_id": "",
        "url": "https://api.github.com/users/JakeWharton",
        "html_url": "https://github.com/JakeWharton",
        "followers_url": "https://api.github.com/users/JakeWharton/followers",
        "following_url":
            "https://api.github.com/users/JakeWharton/following{/other_user}",
        "gists_url": "https://api.github.com/users/JakeWharton/gists{/gist_id}",
        "starred_url":
            "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
        "subscriptions_url":
            "https://api.github.com/users/JakeWharton/subscriptions",
        "organizations_url": "https://api.github.com/users/JakeWharton/orgs",
        "repos_url": "https://api.github.com/users/JakeWharton/repos",
        "events_url":
            "https://api.github.com/users/JakeWharton/events{/privacy}",
        "received_events_url":
            "https://api.github.com/users/JakeWharton/received_events",
        "type": "User",
        "site_admin": false
      },
      "html_url": "https://github.com/JakeWharton/abs.io",
      "description":
          "Simple URL shortener for ActionBarSherlock using node.js and express.",
      "fork": false,
      "url": "https://api.github.com/repos/JakeWharton/abs.io",
      "forks_url": "https://api.github.com/repos/JakeWharton/abs.io/forks",
      "keys_url":
          "https://api.github.com/repos/JakeWharton/abs.io/keys{/key_id}",
      "collaborators_url":
          "https://api.github.com/repos/JakeWharton/abs.io/collaborators{/collaborator}",
      "teams_url": "https://api.github.com/repos/JakeWharton/abs.io/teams",
      "hooks_url": "https://api.github.com/repos/JakeWharton/abs.io/hooks",
      "issue_events_url":
          "https://api.github.com/repos/JakeWharton/abs.io/issues/events{/number}",
      "events_url": "https://api.github.com/repos/JakeWharton/abs.io/events",
      "assignees_url":
          "https://api.github.com/repos/JakeWharton/abs.io/assignees{/user}",
      "branches_url":
          "https://api.github.com/repos/JakeWharton/abs.io/branches{/branch}",
      "tags_url": "https://api.github.com/repos/JakeWharton/abs.io/tags",
      "blobs_url":
          "https://api.github.com/repos/JakeWharton/abs.io/git/blobs{/sha}",
      "git_tags_url":
          "https://api.github.com/repos/JakeWharton/abs.io/git/tags{/sha}",
      "git_refs_url":
          "https://api.github.com/repos/JakeWharton/abs.io/git/refs{/sha}",
      "trees_url":
          "https://api.github.com/repos/JakeWharton/abs.io/git/trees{/sha}",
      "statuses_url":
          "https://api.github.com/repos/JakeWharton/abs.io/statuses/{sha}",
      "languages_url":
          "https://api.github.com/repos/JakeWharton/abs.io/languages",
      "stargazers_url":
          "https://api.github.com/repos/JakeWharton/abs.io/stargazers",
      "contributors_url":
          "https://api.github.com/repos/JakeWharton/abs.io/contributors",
      "subscribers_url":
          "https://api.github.com/repos/JakeWharton/abs.io/subscribers",
      "subscription_url":
          "https://api.github.com/repos/JakeWharton/abs.io/subscription",
      "commits_url":
          "https://api.github.com/repos/JakeWharton/abs.io/commits{/sha}",
      "git_commits_url":
          "https://api.github.com/repos/JakeWharton/abs.io/git/commits{/sha}",
      "comments_url":
          "https://api.github.com/repos/JakeWharton/abs.io/comments{/number}",
      "issue_comment_url":
          "https://api.github.com/repos/JakeWharton/abs.io/issues/comments{/number}",
      "contents_url":
          "https://api.github.com/repos/JakeWharton/abs.io/contents/{+path}",
      "compare_url":
          "https://api.github.com/repos/JakeWharton/abs.io/compare/{base}...{head}",
      "merges_url": "https://api.github.com/repos/JakeWharton/abs.io/merges",
      "archive_url":
          "https://api.github.com/repos/JakeWharton/abs.io/{archive_format}{/ref}",
      "downloads_url":
          "https://api.github.com/repos/JakeWharton/abs.io/downloads",
      "issues_url":
          "https://api.github.com/repos/JakeWharton/abs.io/issues{/number}",
      "pulls_url":
          "https://api.github.com/repos/JakeWharton/abs.io/pulls{/number}",
      "milestones_url":
          "https://api.github.com/repos/JakeWharton/abs.io/milestones{/number}",
      "notifications_url":
          "https://api.github.com/repos/JakeWharton/abs.io/notifications{?since,all,participating}",
      "labels_url":
          "https://api.github.com/repos/JakeWharton/abs.io/labels{/name}",
      "releases_url":
          "https://api.github.com/repos/JakeWharton/abs.io/releases{/id}",
      "deployments_url":
          "https://api.github.com/repos/JakeWharton/abs.io/deployments",
      "created_at": "2011-12-29T18:02:34Z",
      "updated_at": "2022-01-04T04:10:29Z",
      "pushed_at": "2011-12-29T18:02:44Z",
      "git_url": "git://github.com/JakeWharton/abs.io.git",
      "ssh_url": "git@github.com:JakeWharton/abs.io.git",
      "clone_url": "https://github.com/JakeWharton/abs.io.git",
      "svn_url": "https://github.com/JakeWharton/abs.io",
      "homepage": "http://abs.io",
      "size": 108,
      "stargazers_count": 9,
      "watchers_count": 9,
      "language": "JavaScript",
      "has_issues": true,
      "has_projects": true,
      "has_downloads": true,
      "has_wiki": false,
      "has_pages": false,
      "forks_count": 1,
      "mirror_url": null,
      "archived": true,
      "disabled": false,
      "open_issues_count": 0,
      "license": null,
      "allow_forking": true,
      "is_template": false,
      "topics": [],
      "visibility": "public",
      "forks": 1,
      "open_issues": 0,
      "watchers": 9,
      "default_branch": "master"
    };
    Repo repo = Repo.fromJson(json);
    repoBox.add(repo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Jake's Git"),
      ),
      body: ValueListenableBuilder(
        valueListenable: repoBox.listenable(),
        builder: (ctx, box, _) {
          return ListView.builder(
            itemCount: repoBox.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  repoBox.getAt(index)!.name,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRepo,
        tooltip: 'Add Repo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
