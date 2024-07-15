set fish_greeting

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

source $HOME/.config/fish/brew.fish

fish_add_path -gp /usr/local/sbin
fish_add_path -gp $HOME/.bin
fish_add_path -gp $HOME/.local/bin
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

source $HOME/.config/fish/expected_programs.fish

if type -q starship
    starship init fish | source
end

alias rm="rm -i"

if type -q lsd
    alias ls="lsd"
end

if type -q bat
    alias cat="bat"
end

if test -e ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end

source $HOME/.config/fish/nvim.fish
source $HOME/.config/fish/yazi.fish
source $HOME/.config/fish/pomodoro.fish
source $HOME/.config/fish/matrix.fish
