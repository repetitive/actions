#!/bin/bash

set -e

# skip if no /repl
echo "Checking if contains '/repl' command..."
(jq -r ".comment.body" "$GITHUB_EVENT_PATH" | grep -E "/repl") || exit 78

# skip if not a PR
echo "Checking if a PR command..."
(jq -r ".issue.pull_request.url" "$GITHUB_EVENT_PATH") || exit 78

if [[ "$(jq -r ".action" "$GITHUB_EVENT_PATH")" != "created" ]]; then
	echo "This is not a new comment event!"
	exit 78
fi

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

# Evaluate comment and capture output
echo "Evaluate comment and capture output"
output=$(clojure --eval "(+ 1 2 3)")

# Write output to STDOUT
echo "$output"

ISSUE_NUMBER=$(jq -r ".issue.number" "$GITHUB_EVENT_PATH")
REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")
echo "Creating new comment #$ISSUE_NUMBER of $REPO_FULLNAME..."


URI=https://api.github.com
API_HEADER="Accept: application/vnd.github.v3+json"
AUTH_HEADER="Authorization: token $GITHUB_TOKEN"

new_comment_resp=$(curl --data "{\"body\": \"```data```\"}" -X POST -s -H "${AUTH_HEADER}" -H "${API_HEADER}" \
          "${URI}/repos/$REPO_FULLNAME/issues/$ISSUE_NUMBER/comments")


