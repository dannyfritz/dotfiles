ln -sf $(pwd)/alacritty.yml ~/.alacritty.yml
ln -sf $(pwd)/asdfrc ~/.asdfrc
ln -sf $(pwd)/gitconfig ~/.gitconfig
ln -sf $(pwd)/gitignore ~/.gitignore
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/zshrc ~/.zshrc
mkdir -p ~/.config/kitty
ln -sf $(pwd)/kitty.conf  ~/.config/kitty/kitty.conf
mkdir -p ~/.config/fish
ln -sf $(pwd)/config.fish ~/.config/fish/config.fish
ln -sf $(pwd)/fish_plugins ~/.config/fish/fish_plugins
mkdir -p ~/.config/gitui
ln -sf $(pwd)/gitui.ron ~/.config/gitui/key_bindings.ron
