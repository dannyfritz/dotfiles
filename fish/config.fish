set fish_greeting

# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
if test -e /opt/homebrew/bin/brew
  fish_add_path -gpPm "/opt/homebrew/bin" "/opt/homebrew/sbin/"
  eval "$(/opt/homebrew/bin/brew shellenv)"
end
if test -e /home/linuxbrew/.linuxbrew/bin/brew
  fish_add_path -gpPm "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end

fish_add_path -gp /usr/local/sbin
fish_add_path -gp $HOME/.bin
fish_add_path -gp $HOME/.local/bin

if status --is-interactive
  if test -z $TMUX
    tmux
    exit 0
  end
  set --erase expected_programs
  set -a expected_programs asdf\;https://asdf-vm.com/
  set -a expected_programs bat\;https://github.com/sharkdp/bat
  set -a expected_programs delta\;https://github.com/dandavison/delta
  set -a expected_programs entr\;https://github.com/eradman/entr
  set -a expected_programs fd\;https://github.com/sharkdp/fd
  set -a expected_programs figlet\;http://www.figlet.org/
  # set -a expected_programs fish\;https://fishshell.com/
  set -a expected_programs fzf\;https://github.com/junegunn/fzf
  set -a expected_programs gitui\;https://github.com/extrawurst/gitui
  set -a expected_programs glow\;https://github.com/charmbracelet/glow
  set -a expected_programs htop\;https://htop.dev/
  set -a expected_programs jq\;https://github.com/jqlang/jq
  set -a expected_programs lsd\;https://github.com/lsd-rs/lsd
  set -a expected_programs nb\;https://xwmx.github.io/nb
  set -a expected_programs noti\;https://github.com/variadico/noti
  set -a expected_programs nvim\;https://neovim.io/
  set -a expected_programs rg\;https://github.com/BurntSushi/ripgrep
  set -a expected_programs sox\;https://sox.sourceforge.net/
  set -a expected_programs starship\;https://starship.rs/
  set -a expected_programs tmux\;https://github.com/tmux/tmux
  set -a expected_programs utimer\;https://launchpad.net/utimer/
  set -a expected_programs yazi\;https://yazi-rs.github.io/
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
end

alias rm="rm -i"

if type -q lsd
  alias ls="lsd"
end

if type -q bat
  alias cat="bat"
end

if type -q nvim
  set -gx EDITOR nvim
end

if test -d ~/.config/astronvim
  set -gx NVIM_APPNAME astronvim
  alias astro="NVIM_APPNAME=astronvim nvim"
end

if type -q starship
  starship init fish | source
end

if type -q figlet; and type -q utimer; and type -q noti; and type -q play
  abbr --add pmdsb "figlet \"Short break...\"; and utimer --countdown=6m; and noti -t \"Pomodoro\" -m \"Time to focus: pmdf\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
  abbr --add pmdlb "figlet \"Long break...\"; and utimer --countdown=12m; and noti -t \"Pomodoro\" -m \"Time to focus: pmdf\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
  abbr --add pmdf "figlet \"Focus...\"; and utimer --countdown=20m; and noti -t \"Pomodoro\" -m \"Time for a break: pmdsb pmdlb\"; and play -q ~/.config/sounds/birds-chirping-in-a-forest.mp3 silence 1 5 2% trim 0 10 &;"
end

if type -q yazi
    function ya
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    rm -f -- "$tmp"
  end
end

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

if type -q brew; and test -d (brew --prefix)/share/fish/completions
  set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if type -q brew; and test -e (brew --prefix)/share/fish/vendor_completions.d
  set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
if type -q brew; and test -e (brew --prefix)/opt/asdf/libexec/asdf.fish
  source (brew --prefix)/opt/asdf/libexec/asdf.fish
else if test -d ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if test -e ~/.opam/opam-init/init.fish
  source ~/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

