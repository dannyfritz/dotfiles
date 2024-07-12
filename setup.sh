#!/usr/bin/env bash
# Alacritty
ln -nsf $(pwd)/alacritty ~/.config/alacritty
# asdf
ln -sf $(pwd)/asdfrc ~/.asdfrc
# astrovim
ln -nsf $(pwd)/astronvim ~/.config/astronvim
# bat
ln -nsf $(pwd)/bat ~/.config/bat
# git
ln -nsf $(pwd)/git ~/.config/git
# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/fish/*.fish ~/.config/fish/
# gitui
ln -nsf $(pwd)/gitui ~/.config/gitui
# lsd
ln -nsf $(pwd)/lsd ~/.config/lsd
# sounds
ln -nsf $(pwd)/sounds ~/.config/sounds
# starship
ln -sf $(pwd)/starship.toml ~/.config/starship.toml
# tmux
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf ~/.config/tmux/tmux.conf
# yazi
ln -nsf $(pwd)/yazi ~/.config/yazi
