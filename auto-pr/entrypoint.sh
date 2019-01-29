#!/bin/bash

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

if [[ "$(jq -r ".created" "$GITHUB_EVENT_PATH")" != true ]]; then
	echo "This is not a create push branch!"
	exit 78
fi

echo "$(jq -r "." "$GITHUB_EVENT_PATH")"

echo "$(jq -r '.commits | length' "$GITHUB_EVENT_PATH")"



if [[ "$(jq -r '.commits | length' "$GITHUB_EVENT_PATH")" != 0 ]]; then
	echo "This push has not commits!"
	exit 78
fi



commit_message="$(jq -r ".commits[0].message" "$GITHUB_EVENT_PATH")"

echo "Commit message:"
echo "$commit_message"

REPO_FULLNAME=$(jq -r ".repository.full_name" "$GITHUB_EVENT_PATH")

DEFAULT_BRANCH=$(jq -r ".repository.default_branch" "$GITHUB_EVENT_PATH")
CURRENT_BRANCH=$(jq -r ".ref" "$GITHUB_EVENT_PATH")
echo "Creating new PR for $REPO_FULLNAME..."

PULLS_URI=$(jq -r ".repository.url" "$GITHUB_EVENT_PATH")"/pulls"
API_HEADER="Accept: application/vnd.github.v3+json"
AUTH_HEADER="Authorization: token $GITHUB_TOKEN"

new_pr_resp=$(curl --data "{\"title\":\"[WIP]: $commit_message\", \"head\": \"$DEFAULT_BRANCH\", \"base\": \"$DEFAULT_BRANCH\"}" -X POST -s -H "${AUTH_HEADER}" -H "${API_HEADER}" ${PULLS_URI})

echo "$new_comment_resp"
echo "created comment"