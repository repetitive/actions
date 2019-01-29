#!/bin/bash

set -e

if [[ -z "$GITHUB_TOKEN" ]]; then
	echo "Set the GITHUB_TOKEN env variable."
	exit 1
fi

if [[ "$(jq -r ".created" "$GITHUB_EVENT_PATH")" != true ]]; then
	echo "This is not a new comment event!"
	exit 78
fi

output="$(jq -r ".commits" "$GITHUB_EVENT_PATH")"

echo "$output"