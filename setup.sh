#!/usr/bin/env bash
# Alacritty
ln -nsf $(pwd)/alacritty $XDG_CONFIG_HOME/alacritty
# asdf
# ln -sf $(pwd)/asdfrc $XDG_CONFIG_HOME/.asdfrc
# astrovim
ln -nsf $(pwd)/astronvim $XDG_CONFIG_HOME/astronvim
# bat
ln -nsf $(pwd)/bat $XDG_CONFIG_HOME/bat
# git
ln -nsf $(pwd)/git $XDG_CONFIG_HOME/git
# fish
mkdir -p $XDG_CONFIG_HOME/fish
ln -sf $(pwd)/fish/*.fish $XDG_CONFIG_HOME/fish/
# gitui
ln -nsf $(pwd)/gitui $XDG_CONFIG_HOME/gitui
# lsd
ln -nsf $(pwd)/lsd $XDG_CONFIG_HOME/lsd
# ripgrep
ln -sf $(pwd)/ripgreprc $XDG_CONFIG_HOME/.ripgreprc
# sounds
ln -nsf $(pwd)/sounds $XDG_CONFIG_HOME/sounds
# starship
ln -sf $(pwd)/starship.toml $XDG_CONFIG_HOME/starship.toml
# sway
ln -nsf $(pwd)/sway $XDG_CONFIG_HOME/sway
# tmux
mkdir -p $XDG_CONFIG_HOME/tmux
ln -sf $(pwd)/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
# waybar
ln -nsf $(pwd)/waybar $XDG_CONFIG_HOME/waybar
# yazi
ln -nsf $(pwd)/yazi $XDG_CONFIG_HOME/yazi
