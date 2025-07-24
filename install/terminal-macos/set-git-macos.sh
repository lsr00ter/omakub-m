#!/bin/zsh

# Set up git configuration for macOS
echo "Configuring git..."

# Set common git aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global pull.rebase true

# macOS-specific git configurations
git config --global core.autocrlf input
git config --global core.precomposeunicode true
git config --global core.trustctime false

# Set identification from install inputs
if [[ -n "${OMAKUB_USER_NAME//[[:space:]]/}" ]]; then
  git config --global user.name "$OMAKUB_USER_NAME"
  echo "✓ Git user name set to: $OMAKUB_USER_NAME"
fi

if [[ -n "${OMAKUB_USER_EMAIL//[[:space:]]/}" ]]; then
  git config --global user.email "$OMAKUB_USER_EMAIL"
  echo "✓ Git user email set to: $OMAKUB_USER_EMAIL"
fi

# Set up git credential helper for macOS
git config --global credential.helper osxkeychain

echo "✓ Git configuration completed"
echo ""
echo "📝 Git aliases configured:"
echo "   - git co  = git checkout"
echo "   - git br  = git branch"
echo "   - git ci  = git commit"
echo "   - git st  = git status"