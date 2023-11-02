# Alacritty
mkdir -p ~/.config/alacritty
ln -hwsf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
# asdf
ln -hwsf $(pwd)/asdfrc ~/.asdfrc
# git
mkdir -p ~/.config/git
ln -hwsf $(pwd)/gitconfig ~/.config/git/config
ln -hwsf $(pwd)/gitignore ~/.config/git/ignore
# fish
mkdir -p ~/.config/fish
ln -hwsf $(pwd)/config.fish ~/.config/fish/config.fish
ln -hwsf $(pwd)/fish_plugins ~/.config/fish/fish_plugins
# gitui
mkdir -p ~/.config/gitui
ln -hwsf $(pwd)/gitui.ron ~/.config/gitui/key_bindings.ron
# kitty
mkdir -p ~/.config/kitty
ln -hwsf $(pwd)/kitty.conf  ~/.config/kitty/kitty.conf
# lsd
mkdir -p ~/.config/lsd
ln -hwsf $(pwd)/lsd.yaml ~/.config/lsd/config.yaml
# nvim
ln -hwsf $(pwd)/nvim ~/.config/nvim
# starship
ln -hwsf $(pwd)/starship.toml ~/.config/starship.toml
# tmux
mkdir -p ~/.config/tmux
ln -hwsf $(pwd)/tmux.conf ~/.config/tmux/tmux.conf
# yazi
ln -hwsf $(pwd)/yazi ~/.config/yazi
# zsh
ln -hwsf $(pwd)/zshrc ~/.zshrc
