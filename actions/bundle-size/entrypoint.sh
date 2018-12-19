#!/bin/sh

ls -lha build/static/js/*.js  | awk '{print $5,$9}'

DATA=$(ls -lha build/static/js/*.js  | awk '{print $5,$9}')

URL=$(cat /github/workflow/event.json | jq -r .pull_request._links.comments.href)

echo -------
echo "{\"body\":\"$DATA\"}"

curl -d "{\"body\":\"$DATA\"}" \
  -H "Authorization: token $GITHUB_TOKEN" \
  -H "Content-Type: application/json" \
  -X POST "$URL"
