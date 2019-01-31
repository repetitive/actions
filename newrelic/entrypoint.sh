#!/bin/sh

set -e

echo "Record New Relic deployment"

if [[ "$(jq -r ".head_commit" "$GITHUB_EVENT_PATH")" == "null" ]]; then
	echo "This push has not commits!"
	exit 78
fi

commit_message="$(jq -r ".head_commit.message" "$GITHUB_EVENT_PATH")"

echo "Commit message:"
echo "$commit_message"

jq --arg revision "$GITHUB_SHA" --arg user "$GITHUB_ACTOR" --arg description "$commit_message" '. + {deployment: {revision: $revision, user: $user, description: $description}}' <<< '{}' >> newrelic-payload.json
# Capture output
output=$(curl -XPOST --data-binary @newrelic-payload.json -H 'X-Api-Key:$NEWRELIC_API_KEY' -i -H 'Content-Type: application/json' "https://api.newrelic.com/v2/applications/$NEWRELIC_APP_ID/deployments.json")

# Write output to STDOUT
echo "$output"