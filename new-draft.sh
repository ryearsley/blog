#!/bin/bash
cd "$(dirname "$0")"

date=$(date +%Y-%m-%d)

read -p "Title: " title
slug=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd 'a-z0-9-')

mkdir -p drafts
mkdir -p "assets/images/posts/${slug}"
file="drafts/${date}-${slug}.md"

cat > "$file" <<EOF
---
layout: post
title: "${title}"
date: ${date}
---
EOF

echo "Created $file"
