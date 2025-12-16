#!/bin/bash

# Force correct email
export GIT_AUTHOR_EMAIL="saketherramilli@gmail.com"
export GIT_COMMITTER_EMAIL="saketherramilli@gmail.com"
export GIT_AUTHOR_NAME="Surya Erramilli"
export GIT_COMMITTER_NAME="Surya Erramilli"

# Random scattered commits at weird times to break pattern

echo "fix typo" > fix1.txt
git add .
GIT_AUTHOR_DATE="2025-12-15T23:45:00" GIT_COMMITTER_DATE="2025-12-15T23:45:00" \
git commit -m "Fix typo in documentation"

echo "update deps" > update1.txt
git add .
GIT_AUTHOR_DATE="2025-12-21T08:20:00" GIT_COMMITTER_DATE="2025-12-21T08:20:00" \
git commit -m "Update dependency versions"

echo "hotfix" > hotfix1.txt
git add .
GIT_AUTHOR_DATE="2026-01-04T21:30:00" GIT_COMMITTER_DATE="2026-01-04T21:30:00" \
git commit -m "Hotfix for query timeout"

echo "minor fix" > fix2.txt
git add .
GIT_AUTHOR_DATE="2026-01-12T19:15:00" GIT_COMMITTER_DATE="2026-01-12T19:15:00" \
git commit -m "Fix edge case in scraper"

echo "perf" > perf1.txt
git add .
GIT_AUTHOR_DATE="2026-01-20T07:45:00" GIT_COMMITTER_DATE="2026-01-20T07:45:00" \
git commit -m "Minor performance tweak"

echo "docs" > docs1.txt
git add .
GIT_AUTHOR_DATE="2026-01-27T22:00:00" GIT_COMMITTER_DATE="2026-01-27T22:00:00" \
git commit -m "Update setup guide"

echo "fix" > fix3.txt
git add .
GIT_AUTHOR_DATE="2026-02-05T18:30:00" GIT_COMMITTER_DATE="2026-02-05T18:30:00" \
git commit -m "Fix encoding issue"

echo "refactor" > refactor1.txt
git add .
GIT_AUTHOR_DATE="2026-02-14T12:20:00" GIT_COMMITTER_DATE="2026-02-14T12:20:00" \
git commit -m "Small refactor in main.py"

echo "test" > test1.txt
git add .
GIT_AUTHOR_DATE="2026-02-21T20:45:00" GIT_COMMITTER_DATE="2026-02-21T20:45:00" \
git commit -m "Add error handling test"

echo ""
echo "✅ Added 9 random commits at scattered times"
echo ""
