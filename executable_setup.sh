#!/usr/bin/env bash
set -euo pipefail

# --- TPM (tmux plugin manager) ---
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
  echo "TPM already installed, skipping."
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
  echo "TPM installed."
fi

# --- delta (git pager/diff tool) ---
if command -v delta &>/dev/null; then
  echo "delta already installed, skipping."
else
  echo "Installing delta..."
  DELTA_VERSION=$(curl -s https://api.github.com/repos/dandavison/delta/releases/latest | grep '"tag_name"' | sed -E 's/.*"([^"]+)".*/\1/')
  DELTA_DEB="git-delta_${DELTA_VERSION}_amd64.deb"
  TMPDIR=$(mktemp -d)
  curl -fSL "https://github.com/dandavison/delta/releases/download/${DELTA_VERSION}/${DELTA_DEB}" -o "${TMPDIR}/${DELTA_DEB}"
  sudo dpkg -i "${TMPDIR}/${DELTA_DEB}"
  rm -rf "$TMPDIR"
  echo "delta $(delta --version | head -1) installed."
fi
