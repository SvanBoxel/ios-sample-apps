#!/bin/bash
set -e

# declare -a endpoints=("https://api.appcenter.ms/v0.1/public/apps/8c335981-875d-4037-8618-17de0626dfd2/hooks" "https://smee.io/vHU5WwXJYKEG6ZKR" "https://aaaaa3.nl")
# declare -a endpoints=(
#    "https://smee.io/vHU5WwXJYKEG6ZKR" 
#    "https://api.appcenter.ms/v0.1/public/apps/8c335981-875d-4037-8618-17de0626dfd2/hooks"
#    )

# ## now loop through the above array
# for i in "${endpoints[@]}"
# do
#    echo "Proxying payload to $i"
#    curl --header "Content-Type: application/json" -d "data=@${GITHUB_EVENT_PATH}"  $i
#    curl --header "Content-Type: application/json" --data-binary "@${GITHUB_EVENT_PATH}" $i
# done

curl -X POST \
  https://api.appcenter.ms/v0.1/public/apps/3d6dd7b2-5f76-4d00-92f3-b12ef9e5e28d/hooks \
  -H 'Content-Type: application/json' \
  -H 'host: github.com' \
  -H 'x-github-delivery: f38a7f8a-32b4-11e9-92f8-1ac016d94c0d' \
  -H 'x-github-event: ping' \
  -H 'x-hub-signature: sha1=ed4b5605adf5e2b46011300a5d82651b3917c4d3' \
  -d '{
  "ref": "refs/heads/stable",
  "before": "233496cd27408dd500ad2ef81100e9f0deae1f62",
  "after": "ca697157d08dee1f702cada6904954e98d2d819e",
  "created": false,
  "deleted": false,
  "forced": false,
  "base_ref": null,
  "compare": "https://github.com/SvanBoxel/ios-sample-apps/compare/233496cd2740...ca697157d08d",
  "commits": [
    {
      "id": "ca697157d08dee1f702cada6904954e98d2d819e",
      "tree_id": "83ed93b0a7db721f56a9002d4cfb97c9c4b96abc",
      "distinct": true,
      "message": "Update README.md",
      "timestamp": "2019-02-17T14:07:16+01:00",
      "url": "https://github.com/SvanBoxel/ios-sample-apps/commit/ca697157d08dee1f702cada6904954e98d2d819e",
      "author": {
        "name": "Sebass van Boxel",
        "email": "svboxel@gmail.com",
        "username": "SvanBoxel"
      },
      "committer": {
        "name": "GitHub",
        "email": "noreply@github.com",
        "username": "web-flow"
      },
      "added": [

      ],
      "removed": [

      ],
      "modified": [
        "README.md"
      ]
    }
  ],
  "head_commit": {
    "id": "ca697157d08dee1f702cada6904954e98d2d819e",
    "tree_id": "83ed93b0a7db721f56a9002d4cfb97c9c4b96abc",
    "distinct": true,
    "message": "Update README.md",
    "timestamp": "2019-02-17T14:07:16+01:00",
    "url": "https://github.com/SvanBoxel/ios-sample-apps/commit/ca697157d08dee1f702cada6904954e98d2d819e",
    "author": {
      "name": "Sebass van Boxel",
      "email": "svboxel@gmail.com",
      "username": "SvanBoxel"
    },
    "committer": {
      "name": "GitHub",
      "email": "noreply@github.com",
      "username": "web-flow"
    },
    "added": [

    ],
    "removed": [

    ],
    "modified": [
      "README.md"
    ]
  },
  "repository": {
    "id": 165031116,
    "node_id": "MDEwOlJlcG9zaXRvcnkxNjUwMzExMTY=",
    "name": "ios-sample-apps",
    "full_name": "SvanBoxel/ios-sample-apps",
    "private": false,
    "owner": {
      "name": "SvanBoxel",
      "email": "svboxel@gmail.com",
      "login": "SvanBoxel",
      "id": 24505883,
      "node_id": "MDQ6VXNlcjI0NTA1ODgz",
      "avatar_url": "https://avatars3.githubusercontent.com/u/24505883?v=4",
      "gravatar_id": "",
      "url": "https://api.github.com/users/SvanBoxel",
      "html_url": "https://github.com/SvanBoxel",
      "followers_url": "https://api.github.com/users/SvanBoxel/followers",
      "following_url": "https://api.github.com/users/SvanBoxel/following{/other_user}",
      "gists_url": "https://api.github.com/users/SvanBoxel/gists{/gist_id}",
      "starred_url": "https://api.github.com/users/SvanBoxel/starred{/owner}{/repo}",
      "subscriptions_url": "https://api.github.com/users/SvanBoxel/subscriptions",
      "organizations_url": "https://api.github.com/users/SvanBoxel/orgs",
      "repos_url": "https://api.github.com/users/SvanBoxel/repos",
      "events_url": "https://api.github.com/users/SvanBoxel/events{/privacy}",
      "received_events_url": "https://api.github.com/users/SvanBoxel/received_events",
      "type": "User",
      "site_admin": true
    },
    "html_url": "https://github.com/SvanBoxel/ios-sample-apps",
    "description": "Ooyala SDK for iOS Sample Apps",
    "fork": true,
    "url": "https://github.com/SvanBoxel/ios-sample-apps",
    "forks_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/forks",
    "keys_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/keys{/key_id}",
    "collaborators_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/collaborators{/collaborator}",
    "teams_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/teams",
    "hooks_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/hooks",
    "issue_events_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/issues/events{/number}",
    "events_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/events",
    "assignees_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/assignees{/user}",
    "branches_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/branches{/branch}",
    "tags_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/tags",
    "blobs_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/git/blobs{/sha}",
    "git_tags_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/git/tags{/sha}",
    "git_refs_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/git/refs{/sha}",
    "trees_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/git/trees{/sha}",
    "statuses_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/statuses/{sha}",
    "languages_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/languages",
    "stargazers_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/stargazers",
    "contributors_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/contributors",
    "subscribers_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/subscribers",
    "subscription_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/subscription",
    "commits_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/commits{/sha}",
    "git_commits_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/git/commits{/sha}",
    "comments_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/comments{/number}",
    "issue_comment_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/issues/comments{/number}",
    "contents_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/contents/{+path}",
    "compare_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/compare/{base}...{head}",
    "merges_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/merges",
    "archive_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/{archive_format}{/ref}",
    "downloads_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/downloads",
    "issues_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/issues{/number}",
    "pulls_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/pulls{/number}",
    "milestones_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/milestones{/number}",
    "notifications_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/notifications{?since,all,participating}",
    "labels_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/labels{/name}",
    "releases_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/releases{/id}",
    "deployments_url": "https://api.github.com/repos/SvanBoxel/ios-sample-apps/deployments",
    "created_at": 1547112678,
    "updated_at": "2019-02-16T20:55:32Z",
    "pushed_at": 1550408837,
    "git_url": "git://github.com/SvanBoxel/ios-sample-apps.git",
    "ssh_url": "git@github.com:SvanBoxel/ios-sample-apps.git",
    "clone_url": "https://github.com/SvanBoxel/ios-sample-apps.git",
    "svn_url": "https://github.com/SvanBoxel/ios-sample-apps",
    "homepage": "",
    "size": 2364626,
    "stargazers_count": 0,
    "watchers_count": 0,
    "language": "Objective-C",
    "has_issues": false,
    "has_projects": true,
    "has_downloads": true,
    "has_wiki": true,
    "has_pages": false,
    "forks_count": 1,
    "mirror_url": null,
    "archived": false,
    "open_issues_count": 0,
    "license": {
      "key": "other",
      "name": "Other",
      "spdx_id": "NOASSERTION",
      "url": null,
      "node_id": "MDc6TGljZW5zZTA="
    },
    "forks": 1,
    "open_issues": 0,
    "watchers": 0,
    "default_branch": "stable",
    "stargazers": 0,
    "master_branch": "stable"
  },
  "pusher": {
    "name": "SvanBoxel",
    "email": "svboxel@gmail.com"
  },
  "sender": {
    "login": "SvanBoxel",
    "id": 24505883,
    "node_id": "MDQ6VXNlcjI0NTA1ODgz",
    "avatar_url": "https://avatars3.githubusercontent.com/u/24505883?v=4",
    "gravatar_id": "",
    "url": "https://api.github.com/users/SvanBoxel",
    "html_url": "https://github.com/SvanBoxel",
    "followers_url": "https://api.github.com/users/SvanBoxel/followers",
    "following_url": "https://api.github.com/users/SvanBoxel/following{/other_user}",
    "gists_url": "https://api.github.com/users/SvanBoxel/gists{/gist_id}",
    "starred_url": "https://api.github.com/users/SvanBoxel/starred{/owner}{/repo}",
    "subscriptions_url": "https://api.github.com/users/SvanBoxel/subscriptions",
    "organizations_url": "https://api.github.com/users/SvanBoxel/orgs",
    "repos_url": "https://api.github.com/users/SvanBoxel/repos",
    "events_url": "https://api.github.com/users/SvanBoxel/events{/privacy}",
    "received_events_url": "https://api.github.com/users/SvanBoxel/received_events",
    "type": "User",
    "site_admin": true
  }
}'
