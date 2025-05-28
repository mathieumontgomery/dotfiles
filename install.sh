#!/bin/bash
set -e  # exit on error
set -x  # print commands

# Check if fzf is already installed
if command -v fzf >/dev/null 2>&1; then
  echo "fzf is already installed."
else
  # Detect platform and install
  if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    if command -v brew >/dev/null 2>&1; then
      brew install fzf
    else
      echo "Homebrew not found. Please install Homebrew first: https://brew.sh/"
      exit 1
    fi
  else
    # Assume Debian-based Linux
    sudo apt-get update
    sudo apt-get install -y zsh
    sudo apt-get install -y fzf
    chsh -s $(which zsh)
  fi
fi

# Remove existing dotfiles if they exist
[ -f ~/.zshrc ] && rm ~/.zshrc
[ -d ~/.oh-my-zsh ] && rm -rf ~/.oh-my-zsh
[ -f ~/.zsh_aliases ] && rm ~/.zsh_aliases

# Initialize submodules
git submodule update --init --recursive

# Create symlinks
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/zsh-plugins/alias-tips ~/dotfiles/oh-my-zsh/plugins/alias-tips

# Ensure personal and company zsh config files exist
mkdir -p ~/dotfiles/zsh_private
touch ~/dotfiles/zsh_private/zshrc_personal
touch ~/dotfiles/zsh_private/aliases_personal
touch ~/dotfiles/zsh_private/zshrc_company
touch ~/dotfiles/zsh_private/aliases_company

# If you want to use the p10k.zsh from this project
# [ -f ~/.p10k.zsh ] && rm ~/.p10k.zsh
# ln -s ~/dotfiles/zshrc ~/.zshrc