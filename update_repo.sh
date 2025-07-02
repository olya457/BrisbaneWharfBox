
set -euo pipefail

COMMIT_MESSAGE=${1:-"Update"}
BRANCH_NAME=${2:-"feature-$(date +%Y%m%d-%H%M%S)"}

PROJECT_PATH="/Users/ola/Downloads/ReactNative/BrisbaneWharfBox"

GITHUB_USER="olya457"
REPO_NAME="BrisbaneWharfBox"

cd "$PROJECT_PATH" || { echo "❌ Project folder not found"; exit 1; }


git remote remove origin 2>/dev/null || true
git remote add origin "git@github.com:$GITHUB_USER/$REPO_NAME.git"

git checkout -b "$BRANCH_NAME"

git add .

git commit --allow-empty -m "$COMMIT_MESSAGE"

git push -u origin "$BRANCH_NAME"

echo "✅ Commit pushed to branch '$BRANCH_NAME'"
echo "🔗 Open Pull Request: https://github.com/$GITHUB_USER/$REPO_NAME/pull/new/$BRANCH_NAME"
