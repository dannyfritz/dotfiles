#!/usr/bin/env bash
# Alacritty
ln -nsf $(pwd)/alacritty ~/.config/alacritty
# asdf
ln -sf $(pwd)/asdfrc ~/.asdfrc
# astrovim
if [ ! -d ~/.config/astronvim ]; then
  git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/astronvim
fi
ln -nsf $(pwd)/astronvim ~/.config/astronvim/lua/user
ln -nsf $(pwd)/astronvim_v4 ~/.config/astronvimv4
# bat
ln -nsf $(pwd)/bat ~/.config/bat
# git
ln -nsf $(pwd)/git ~/.config/git
# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish/fish_plugins ~/.config/fish/fish_plugins
# gitui
ln -nsf $(pwd)/gitui ~/.config/gitui
# lsd
ln -nsf $(pwd)/lsd ~/.config/lsd
# nvim
ln -nsf $(pwd)/nvim ~/.config/nvim
# sounds
ln -nsf $(pwd)/sounds ~/.config/sounds
# starship
ln -sf $(pwd)/starship.toml ~/.config/starship.toml
# tmux
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf ~/.config/tmux/tmux.conf
# yazi
ln -nsf $(pwd)/yazi ~/.config/yazi
