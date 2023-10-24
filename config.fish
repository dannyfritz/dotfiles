set fish_greeting

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"
end

fish_add_path -g -a /usr/local/sbin
fish_add_path -g -a $HOME/.bin
fish_add_path -g -a $HOME/.local/bin
alias nvimdiff "nvim -d"

if test -z $TMUX
    tmux
    exit 0
end

set --erase expected_programs
set expected_programs $expected_programs asdf\;https://yazi-rs.github.io/
set expected_programs $expected_programs bat\;https://github.com/sharkdp/bat
set expected_programs $expected_programs entr\;https://github.com/eradman/entr
set expected_programs $expected_programs fzf\;https://github.com/junegunn/fzf
set expected_programs $expected_programs glow\;https://github.com/charmbracelet/glow
set expected_programs $expected_programs htop\;https://htop.dev/
set expected_programs $expected_programs jq\;https://github.com/jqlang/jq
set expected_programs $expected_programs lsd\;https://github.com/lsd-rs/lsd
set expected_programs $expected_programs nvim\;https://neovim.io/
set expected_programs $expected_programs rg\;https://github.com/BurntSushi/ripgrep
set expected_programs $expected_programs starship\;https://starship.rs/
set expected_programs $expected_programs yazi\;https://yazi-rs.github.io/
for expected_program in $expected_programs
  begin
    string match -q -r '(?<program>.*);(?<website>.*)' $expected_program
    if not type -q $program
      set_color normal 
      set_color bryellow
      echo -n Warning:\ 
      set_color -o brgreen
      echo -n $program\ 
      set_color normal 
      echo is not installed or is missing from the \$PATH!
      if test -n $website
        set_color normal 
        echo -n "        " Visit\ 
        set_color -o brwhite
        echo -n $website
        set_color normal 
        echo \ for more information.
        set_color brwhite
      end
      set_color normal 
    end
  end
end

if type -q starship
  starship init fish | source
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
else if test -d ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end

