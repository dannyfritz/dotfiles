set fish_greeting

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

fish_add_path -g -a /usr/local/sbin
fish_add_path -g -a $HOME/.bin
fish_add_path -g -a $HOME/.local/bin

if test -z $TMUX
    tmux
    exit 0
end

# https://starship.rs/
if type -q starship
    starship init fish | source
else
    echo "Error: Prompt missing. Please install Starship https://starship.rs/"
end

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

if type -q brew; and test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if type -q brew; and test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
if type -q brew; and test -d (brew --prefix)"/opt/asdf/libexec/asdf.fish"
    source (brew --prefix)/opt/asdf/libexec/asdf.fish
end

if test -d ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

# https://github.com/pure-fish/pure
set --universal pure_enable_container_detection false
set --universal pure_enable_git false
set --universal pure_enable_virtualenv false
set --universal pure_separate_prompt_on_error true
set --universal pure_show_subsecond_command_duration true
set --universal pure_threshold_command_duration 0

# https://github.com/IlanCosman/tide
set --universal tide_cmd_duration_threshold 0
set --universal tide_cmd_duration_decimals 1
set --universal tide_left_prompt_items pwd newline character
set --universal tide_right_prompt_items cmd_duration status
