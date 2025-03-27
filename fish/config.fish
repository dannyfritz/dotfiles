source $HOME/.config/fish/brew.fish

fish_add_path -gp /usr/local/sbin
fish_add_path -gp $HOME/.bin
fish_add_path -gp $HOME/.local/bin

set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

if type -q rg
    set -gx RIPGREP_CONFIG_PATH $XDG_CONFIG_HOME/.ripgreprc
end

if not status --is-interactive
    exit 0
end

# https://fishshell.com/docs/current/interactive.html#vi-mode-commands
fish_vi_key_bindings

if test -z $TMUX
    tmux
    exit 0
end

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

source $XDG_CONFIG_HOME/fish/expected_programs.fish
source $XDG_CONFIG_HOME/fish/nvim.fish
source $XDG_CONFIG_HOME/fish/yazi.fish
source $XDG_CONFIG_HOME/fish/pomodoro.fish

if type -q mise
    mise activate fish | source
end

if type -q starship
    starship init fish | source
end

function hibernate
    systemctl hibernate
end

alias rm="rm -i"

if type -q bat
    alias cat="bat"
end

if type -q cmatrix
    alias matrix="cmatrix -a -b -u 3"
end

if type -q gitui
    alias gitui="gitui --watcher"
end

if type -q lsd
    alias ls="lsd"
end

alias less="less -R --mouse"

if test -e ~/.opam/opam-init/init.fish
    source ~/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true
end

if type -q fzf
    function fhistory
        history | fzf --no-sort | read -l line
        commandline -j $line
    end
end

if type -q fzf;
    and type -q rga
    function rga-fzf
        set RG_PREFIX 'rga --files-with-matches'
        if test (count $argv) -gt 1
            set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
        end
        set -l file $file
        set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && echo "opening $file" && open "$file"
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
        if uname -s | grep -q Darwin
            __banner Brew Cask
            brew upgrade --cask --greedy
        end
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
    if type -q mise
        __banner mise
        mise plugins update
        mise upgrade
    end
    if type -q nvim
        __banner Neovim
        nvim --headless "+Lazy! sync" +qa | rg --color=never "log.*\s\|\s"
        nvim --headless "+Lazy! sync" +qa | rg --color=never "log.*\s\|\s"
        nvim --headless "+MasonToolsInstallSync!" +qa
        nvim --headless "+MasonToolsUpdateSync!" +qa
    end
    if type -q flatpak
        __banner Flatpak
        flatpak update
    end
    if type -q dnf
        __banner DNF
        sudo dnf upgrade
    end
end
