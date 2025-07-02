
set -euo pipefail

APP_NAME="Brisbane Wharf Box"
REPO_NAME=$(echo "$APP_NAME" | tr ' ' '-' | tr '[:upper:]' '[:lower:]')

USERNAME="olya457"

PROJECT_PATH="/Users/ola/Downloads/ReactNative/BrisbaneWharfBox"

command -v gh >/dev/null || { echo "❌ Install GitHub CLI: https://cli.github.com/"; exit 1; }
gh auth status >/dev/null || { echo "❌ Not logged in to gh. Run: gh auth login"; exit 1; }

cd "$PROJECT_PATH" || { echo "❌ Project folder not found: $PROJECT_PATH"; exit 1; }

if [ ! -d .git ]; then
  git init
  git branch -M main
fi

git add .
git commit -m "Initial commit" || echo "– Nothing is committed"

git remote remove origin 2>/dev/null || true

gh repo create "$USERNAME/$REPO_NAME" \
  --private \
  --source=. \
  --remote=origin \
  --push \
  --confirm

echo "✅ The repository has been created and uploaded.: https://github.com/$USERNAME/$REPO_NAME"
