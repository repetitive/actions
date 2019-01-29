#!/bin/sh

set -e

# Capture output
output=$( sh -c "curl http://google.com/ping?sitemap=$*" )

# Write output to STDOUT
echo "$output"