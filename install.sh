#!/bin/bash
set -x

brew install fzf

rm ~/.zshrc
rm ~/.p10k.zsh
rm -rf ~/.oh-my-zsh
rm ~/.zsh_aliases

git submodule update --init --recursive

ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/oh-my-zsh ~/.oh-my-zsh
ln -s ~/dotfiles/zsh_aliases ~/.zsh_aliases
ln -s ~/dotfiles/zsh-plugins/alias-tips ~/dotfiles/oh-my-zsh/plugins/alias-tips

touch ~/dotfiles/zsh_private/zshrc_personal
touch ~/dotfiles/zsh_private/aliases_personal

touch ~/dotfiles/zsh_private/zshrc_company
touch ~/dotfiles/zsh_private/aliases_company
