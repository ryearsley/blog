#!/bin/bash
cd "$(dirname "$0")"
git add -A
git commit -m "Publish: $(date +%Y-%m-%d)"
git push
