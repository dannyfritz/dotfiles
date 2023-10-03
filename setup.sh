# Alacritty
mkdir -p ~/.config/alacritty
ln -sf $(pwd)/alacritty.yml ~/.config/alacritty/alacritty.yml
# asdf
ln -sf $(pwd)/asdfrc ~/.asdfrc
# git
mkdir -p ~/.config/git
ln -sf $(pwd)/gitconfig ~/.config/git/config
ln -sf $(pwd)/gitignore ~/.config/git/ignore
# fish
mkdir -p ~/.config/fish
ln -sf $(pwd)/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish_plugins ~/.config/fish/fish_plugins
# gitui
mkdir -p ~/.config/gitui
ln -sf $(pwd)/gitui.ron ~/.config/gitui/key_bindings.ron
# kitty
mkdir -p ~/.config/kitty
ln -sf $(pwd)/kitty.conf  ~/.config/kitty/kitty.conf
# nvim
ln -sf $(pwd)/nvim ~/.config/nvim
# starship
ln -sf $(pwd)/starship.toml ~/.config/starship.toml
# tmux
mkdir -p ~/.config/tmux
ln -sf $(pwd)/tmux.conf ~/.config/tmux/tmux.conf
# zsh
ln -sf $(pwd)/zshrc ~/.zshrc
