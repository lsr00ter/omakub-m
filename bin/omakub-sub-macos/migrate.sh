#!/bin/zsh

# Migration script for macOS version updates
echo "Checking for Omakub macOS migrations..."

# Check if we have a migrations directory
if [ -d "$OMAKUB_PATH/migrations-macos" ]; then
    # Run any pending migrations
    for migration in $OMAKUB_PATH/migrations-macos/*.sh; do
        if [ -f "$migration" ]; then
            echo "Running migration: $(basename $migration)"
            source "$migration"
        fi
    done
fi

# Update Omakub itself
echo "Updating Omakub for macOS..."
cd $OMAKUB_PATH
git pull origin master

echo "Omakub macOS update completed!"