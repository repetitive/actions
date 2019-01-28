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

PR_NUMBER=$(jq -r ".issue.number" "$GITHUB_EVENT_PATH")
REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")
echo "Collecting information about PR #$PR_NUMBER of $REPO_FULLNAME..."

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

URI=https://api.github.com
API_HEADER="Accept: application/vnd.github.v3+json"
AUTH_HEADER="Authorization: token $GITHUB_TOKEN"

pr_resp=$(curl -X GET -s -H "${AUTH_HEADER}" -H "${API_HEADER}" \
          "${URI}/repos/$REPO_FULLNAME/pulls/$PR_NUMBER")


# Capture output
output=$(clojure --eval "$*")

# Preserve output for consumption by downstream actions
echo "$output" > "${HOME}/${GITHUB_ACTION}.${AWS_DEFAULT_OUTPUT}"

# Write output to STDOUT
echo "$output"