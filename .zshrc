if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

. $(brew --prefix asdf)/asdf.sh
export PATH="/usr/local/sbin:$PATH"

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Themes
zplug "agkozak/agkozak-zsh-prompt"
zplug "popstas/zsh-command-time", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "MikeDacre/tmux-zsh-vim-titles", defer:2

# Utilities
zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "hlissner/zsh-autopair", defer:2
zplug "MikeDacre/careful_rm", defer:2
zplug "ael-code/zsh-colored-man-pages", defer:2

# Language Helpers
zplug "kiurchv/asdf.plugin.zsh", defer:2
zplug "plugins/git", from:oh-my-zsh, defer:2
zplug "plugins/sudo", from:oh-my-zsh, defer:2
zplug "plugins/debian", from:oh-my-zsh, defer:2

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Disable ctrl+s terminal pausing
stty -ixon

bindkey -v
export KEYTIMEOUT=1

ZSH_AUTOSUGGEST_USE_ASYNC="yes"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1

ZSH_COMMAND_TIME_MIN_SECONDS=3
ZSH_COMMAND_TIME_MSG="⏱: %s"
ZSH_COMMAND_TIME_COLOR="cyan"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="--layout=reverse --inline-info --bind='enter:execute(xdg-open {})+clear-query'"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char


if [[ "$OSTYPE" == "linux-gnu" ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "darwin"* ]]; then
    alias ls='ls -G'
elif [[ "$OSTYPE" == "cygwin" ]]; then
    alias ls='ls --color=auto'
elif [[ "$OSTYPE" == "msys" ]]; then
    alias ls='ls --color=auto'
else
    echo "What OS is this? $OSTYPE"
fi

#[[ $SHLVL != "2" ]] && (tmux attach || tmux new)
[[ $SHLVL != "2" ]] && tmux

