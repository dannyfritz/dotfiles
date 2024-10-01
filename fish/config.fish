function fish_greeting
    if test -z $TMUX
        return
    end
    if type -q fortune
        set_color --dim --italics
        fortune
        set_color normal
    end
end

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

if status --is-interactive
    if test -z $TMUX
        tmux
        exit 0
    end
end

source $XDG_CONFIG_HOME/fish/expected_programs.fish
source $XDG_CONFIG_HOME/fish/nvim.fish
source $XDG_CONFIG_HOME/fish/yazi.fish
source $XDG_CONFIG_HOME/fish/pomodoro.fish
source $XDG_CONFIG_HOME/fish/nb.fish

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

if type -q cmatrix
    alias matrix="cmatrix -a -b -u 3"
end

if type -q rg
    set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/.ripgreprc
end

if type -q gitui
    alias gitui="gitui --watcher"
end

if test -e ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end

if type -q fzf
    function fhistory
        history | fzf --no-sort | read -l line
        commandline -j $line
    end
end

function dotfiles -d "Modify and sync dotfiles"
    set -f LOCATION ~/dotfiles
    function __dotfileshelp -V LOCATION
        set_color normal
        printf "Modify and sync $LOCATION\n\n"
        set_color -o brwhite
        printf "USAGE:\n"
        set_color normal
        printf "\tdotfiles [COMMAND]\n\n"
        set_color -o brwhite
        printf "COMMANDS:\n"
        set_color normal
        printf "\tdotfiles\t\talias to \"dotfiles open\"\n"
        printf "\tdotfiles open\t\tOpen nvim\n"
        printf "\tdotfiles sync\t\tOpen gitui\n"
        set_color normal
    end
    if not test -e $LOCATION;
        and not test -d $LOCATION
        set_color yellow
        echo "No directory found at \"$LOCATION\"!"
        set_color normal
        return 1
    end
    if test -z $argv;
        or test $argv = open
        if not type -q nvim
            set_color yellow
            echo "Missing \"nvim\" command!"
            set_color normal
            return 1
        end
        command nvim --cmd "cd $LOCATION"
        source $LOCATION/fish/config.fish
        return 0
    else if test "$argv" = sync
        if not type -q gitui
            set_color yellow
            echo "Missing \"gitui\" command!"
            set_color normal
            return 1
        end
        if not test -d $(printf "%s/.git" $LOCATION)
            set_color yellow
            printf '"%s" is not a git repository.\n' $LOCATION
            set_color normal
            return 1
        end
        command gitui --directory $LOCATION
        return 0
    else
        set_color yellow
        printf 'Unknown COMMAND: "%s"\n\n' $argv
        __dotfileshelp
        return 1
    end
end

function __banner
    set_color --bold bryellow
    if type -q figlet
        figlet -w $(tput cols) $argv
    else
        string repeat -n $(math $(string length $argv) + 15) '#'
        echo "## Updating $argv ##"
        string repeat -n $(math $(string length $argv) + 15) '#'
    end
    set_color normal
end

function update_all
    if type -q brew
        __banner Brew
        brew upgrade
        __banner Brew Cask
        brew upgrade --cask --greedy
    end
    if type -q fisher
        __banner Fisher
        fisher update
    end
    if test -e ~/.tmux/plugins/tpm/bin/update_plugins
        __banner tmux tpm
        ~/.tmux/plugins/tpm/bin/update_plugins all
    end
    if type -q asdf
        __banner asdf
        asdf plugin update --all
    end
    if type -q nvim
        __banner Neovim
        nvim --headless "+Lazy! sync" +qa | rg --color=never "log.*\s\|\s"
        nvim --headless "+Lazy! sync" +qa | rg --color=never "log.*\s\|\s"
        # nvim --headless "+MasonUpdate" +qa
    end
    if type -q flatpak
        __banner Flatpak
        flatpak update
    end
    if type -q dnf5
        __banner DNF
        sudo dnf5 upgrade
    end
end
