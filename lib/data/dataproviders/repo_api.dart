class RepoAPI {
  /// it fetches the json of repositories from api and return it
  Future<List<Map<String, dynamic>>> getRawRepos(int pageCount) async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      {
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
          "gists_url":
              "https://api.github.com/users/JakeWharton/gists{/gist_id}",
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
      },
      {
        "id": 1451060,
        "node_id": "MDEwOlJlcG9zaXRvcnkxNDUxMDYw",
        "name": "ActionBarSherlock",
        "full_name": "JakeWharton/ActionBarSherlock",
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
          "gists_url":
              "https://api.github.com/users/JakeWharton/gists{/gist_id}",
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
        "html_url": "https://github.com/JakeWharton/ActionBarSherlock",
        "description":
            "[DEPRECATED] Action bar implementation which uses the native action bar on Android 4.0+ and a custom implementation on pre-4.0 through a single API and theme.",
        "fork": false,
        "url": "https://api.github.com/repos/JakeWharton/ActionBarSherlock",
        "forks_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/forks",
        "keys_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/keys{/key_id}",
        "collaborators_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/collaborators{/collaborator}",
        "teams_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/teams",
        "hooks_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/hooks",
        "issue_events_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/issues/events{/number}",
        "events_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/events",
        "assignees_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/assignees{/user}",
        "branches_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/branches{/branch}",
        "tags_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/tags",
        "blobs_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/git/blobs{/sha}",
        "git_tags_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/git/tags{/sha}",
        "git_refs_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/git/refs{/sha}",
        "trees_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/git/trees{/sha}",
        "statuses_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/statuses/{sha}",
        "languages_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/languages",
        "stargazers_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/stargazers",
        "contributors_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/contributors",
        "subscribers_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/subscribers",
        "subscription_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/subscription",
        "commits_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/commits{/sha}",
        "git_commits_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/git/commits{/sha}",
        "comments_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/comments{/number}",
        "issue_comment_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/issues/comments{/number}",
        "contents_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/contents/{+path}",
        "compare_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/compare/{base}...{head}",
        "merges_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/merges",
        "archive_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/{archive_format}{/ref}",
        "downloads_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/downloads",
        "issues_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/issues{/number}",
        "pulls_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/pulls{/number}",
        "milestones_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/milestones{/number}",
        "notifications_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/notifications{?since,all,participating}",
        "labels_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/labels{/name}",
        "releases_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/releases{/id}",
        "deployments_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock/deployments",
        "created_at": "2011-03-07T17:28:54Z",
        "updated_at": "2022-01-03T18:23:30Z",
        "pushed_at": "2015-12-17T17:54:50Z",
        "git_url": "git://github.com/JakeWharton/ActionBarSherlock.git",
        "ssh_url": "git@github.com:JakeWharton/ActionBarSherlock.git",
        "clone_url": "https://github.com/JakeWharton/ActionBarSherlock.git",
        "svn_url": "https://github.com/JakeWharton/ActionBarSherlock",
        "homepage": "http://actionbarsherlock.com",
        "size": 21244,
        "stargazers_count": 7163,
        "watchers_count": 7163,
        "language": "Java",
        "has_issues": true,
        "has_projects": true,
        "has_downloads": true,
        "has_wiki": false,
        "has_pages": true,
        "forks_count": 3669,
        "mirror_url": null,
        "archived": true,
        "disabled": false,
        "open_issues_count": 91,
        "license": {
          "key": "apache-2.0",
          "name": "Apache License 2.0",
          "spdx_id": "Apache-2.0",
          "url": "https://api.github.com/licenses/apache-2.0",
          "node_id": "MDc6TGljZW5zZTI="
        },
        "allow_forking": true,
        "is_template": false,
        "topics": [],
        "visibility": "public",
        "forks": 3669,
        "open_issues": 91,
        "watchers": 7163,
        "default_branch": "master"
      },
      {
        "id": 11718829,
        "node_id": "MDEwOlJlcG9zaXRvcnkxMTcxODgyOQ==",
        "name": "ActionBarSherlock-Gradle-Sample",
        "full_name": "JakeWharton/ActionBarSherlock-Gradle-Sample",
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
          "gists_url":
              "https://api.github.com/users/JakeWharton/gists{/gist_id}",
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
        "html_url":
            "https://github.com/JakeWharton/ActionBarSherlock-Gradle-Sample",
        "description":
            "[DEPRECATED] A tiny sample project that uses ActionBarSherlock via Gradle",
        "fork": false,
        "url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample",
        "forks_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/forks",
        "keys_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/keys{/key_id}",
        "collaborators_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/collaborators{/collaborator}",
        "teams_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/teams",
        "hooks_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/hooks",
        "issue_events_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/issues/events{/number}",
        "events_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/events",
        "assignees_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/assignees{/user}",
        "branches_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/branches{/branch}",
        "tags_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/tags",
        "blobs_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/git/blobs{/sha}",
        "git_tags_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/git/tags{/sha}",
        "git_refs_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/git/refs{/sha}",
        "trees_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/git/trees{/sha}",
        "statuses_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/statuses/{sha}",
        "languages_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/languages",
        "stargazers_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/stargazers",
        "contributors_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/contributors",
        "subscribers_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/subscribers",
        "subscription_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/subscription",
        "commits_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/commits{/sha}",
        "git_commits_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/git/commits{/sha}",
        "comments_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/comments{/number}",
        "issue_comment_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/issues/comments{/number}",
        "contents_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/contents/{+path}",
        "compare_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/compare/{base}...{head}",
        "merges_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/merges",
        "archive_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/{archive_format}{/ref}",
        "downloads_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/downloads",
        "issues_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/issues{/number}",
        "pulls_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/pulls{/number}",
        "milestones_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/milestones{/number}",
        "notifications_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/notifications{?since,all,participating}",
        "labels_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/labels{/name}",
        "releases_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/releases{/id}",
        "deployments_url":
            "https://api.github.com/repos/JakeWharton/ActionBarSherlock-Gradle-Sample/deployments",
        "created_at": "2013-07-28T11:19:58Z",
        "updated_at": "2020-06-01T01:02:26Z",
        "pushed_at": "2013-07-28T11:21:04Z",
        "git_url":
            "git://github.com/JakeWharton/ActionBarSherlock-Gradle-Sample.git",
        "ssh_url":
            "git@github.com:JakeWharton/ActionBarSherlock-Gradle-Sample.git",
        "clone_url":
            "https://github.com/JakeWharton/ActionBarSherlock-Gradle-Sample.git",
        "svn_url":
            "https://github.com/JakeWharton/ActionBarSherlock-Gradle-Sample",
        "homepage": "",
        "size": 42,
        "stargazers_count": 52,
        "watchers_count": 52,
        "language": "Groovy",
        "has_issues": true,
        "has_projects": false,
        "has_downloads": true,
        "has_wiki": false,
        "has_pages": false,
        "forks_count": 14,
        "mirror_url": null,
        "archived": true,
        "disabled": false,
        "open_issues_count": 1,
        "license": {
          "key": "apache-2.0",
          "name": "Apache License 2.0",
          "spdx_id": "Apache-2.0",
          "url": "https://api.github.com/licenses/apache-2.0",
          "node_id": "MDc6TGljZW5zZTI="
        },
        "allow_forking": true,
        "is_template": false,
        "topics": [],
        "visibility": "public",
        "forks": 14,
        "open_issues": 1,
        "watchers": 52,
        "default_branch": "master"
      }
    ];
  }
}
