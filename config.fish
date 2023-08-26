if test $SHLVL = 1
	tmux
	exit
end

fish_add_path -a /usr/local/sbin
fish_add_path -a $HOME/.bin
fish_add_path -a $HOME/.local/bin

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
if type -q brew; and test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if type -q brew; and test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

if test -d ~/.asdf
	source ~/.asdf/asdf.fish
end

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

# https://github.com/IlanCosman/tide
set --universal tide_cmd_duration_threshold 0
set --universal tide_cmd_duration_decimals 1
set --universal tide_left_prompt_items pwd newline character
