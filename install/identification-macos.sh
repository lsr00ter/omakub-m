#!/bin/zsh

echo "Enter identification for git and autocomplete..."

# Get system name (macOS equivalent of getent)
SYSTEM_NAME=$(dscl . -read /Users/"$USER" RealName | sed -n 's/^ //g;2p')

# Fallback to USER if RealName is empty
if [[ -z "$SYSTEM_NAME" || "$SYSTEM_NAME" == "RealName:" ]]; then
    SYSTEM_NAME="$USER"
fi

export OMAKUB_USER_NAME=$(gum input --placeholder "Enter full name" --value "$SYSTEM_NAME" --prompt "Name> ")
export OMAKUB_USER_EMAIL=$(gum input --placeholder "Enter email address" --prompt "Email> ")

echo "✓ User identification configured: $OMAKUB_USER_NAME <$OMAKUB_USER_EMAIL>"