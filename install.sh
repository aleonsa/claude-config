#!/bin/bash

set -e

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
SOURCE_DIR="$REPO_DIR/claude"

echo "🤖 Installing claude-config..."
echo "   Repo:   $REPO_DIR"
echo "   Target: $CLAUDE_DIR"
echo ""

# Create ~/.claude if it doesn't exist
mkdir -p "$CLAUDE_DIR"

# Helper: create symlink, backing up existing file if needed
link() {
  local src="$1"
  local dst="$2"

  # If dst exists and is NOT already a symlink to our src, back it up
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "   📦 Backing up existing $(basename $dst) → $(basename $dst).bak"
    mv "$dst" "${dst}.bak"
  fi

  # Remove stale symlink if present
  if [ -L "$dst" ]; then
    rm "$dst"
  fi

  ln -s "$src" "$dst"
  echo "   ✅ $(basename $dst)"
}

# Helper: symlink a whole directory
link_dir() {
  local src="$1"
  local dst="$2"

  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "   📦 Backing up existing $(basename $dst)/ → $(basename $dst).bak/"
    mv "$dst" "${dst}.bak"
  fi

  if [ -L "$dst" ]; then
    rm "$dst"
  fi

  ln -s "$src" "$dst"
  echo "   ✅ $(basename $dst)/"
}

echo "── Files ──────────────────────────────"
link "$SOURCE_DIR/CLAUDE.md"      "$CLAUDE_DIR/CLAUDE.md"
link "$SOURCE_DIR/settings.json"  "$CLAUDE_DIR/settings.json"

echo ""
echo "── Directories ────────────────────────"
link_dir "$SOURCE_DIR/rules"    "$CLAUDE_DIR/rules"
link_dir "$SOURCE_DIR/agents"   "$CLAUDE_DIR/agents"
link_dir "$SOURCE_DIR/commands" "$CLAUDE_DIR/commands"
link_dir "$SOURCE_DIR/skills"   "$CLAUDE_DIR/skills"

echo ""
echo "✨ Done! Verify with: ls -la ~/.claude"
