#!/bin/sh

ls -lha build/static/js/*.js  | awk '{print $5,$9}'

DATA=$(ls -lha build/static/js/*.js  | awk '{print $5,$9}')

URL=$(cat /github/workflow/event.json | jq .pull_request._links.comments.href)

echo -------
echo $DATA
echo $URL

curl -d '{\"body\":\"$DATA\"}' -H "Authorization: token $GITHUB_TOKEN" -H "Content-Type: application/json" -X POST "$URL"
