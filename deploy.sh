#!/bin/bash
rm -rf dist/ || exit 0;

mkdir dist/
cp CNAME dist/
wget https://feeds.soundcloud.com/users/soundcloud:users:1603389/sounds.rss -O dist/podcast.rss

( cd dist/
  git init
  git config user.name "Travis-CI"
  git config user.email "renyard@users.noreply.github.com"
  git add .
  git commit -m "Deployed to Github Pages"
  git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
)
