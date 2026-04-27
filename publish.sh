#!/bin/bash
cd "$(dirname "$0")"

today=$(date +%Y-%m-%d)

# Add/update 'updated' date in front matter for modified posts
for file in $(git diff --name-only _posts/); do
  if grep -q '^updated:' "$file"; then
    sed -i '' "s/^updated:.*/updated: $today/" "$file"
  else
    sed -i '' "/^date:.*/a\\
updated: $today
" "$file"
  fi
done

git add -A
git commit -m "Publish: $today"
git push
