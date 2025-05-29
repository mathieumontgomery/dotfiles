# Dotfiles
Personnal dotfile configuration with: 
- `zsh` + `oh-my-zsh`,
- `p10k` (a default theme is included),
- custom aliases and zshrc for personnal and company.

## Installation
1) Run `install.sh`
2) To add default theme included, 
```bash
[ -f ~/.p10k.zsh ] && rm ~/.p10k.zsh
ln -s ~/dotfiles/zshrc ~/.zshrc
```
/!\ This will delete current configuration for oh-my-zsh 

## Update
1) Run `install.sh`