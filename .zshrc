if [[ ! -d ~/.zplug ]]; then
    git clone https://github.com/zplug/zplug ~/.zplug
    source ~/.zplug/init.zsh && zplug update --self
fi

source ~/.zplug/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Themes
#zplug "themes/arrow", from:oh-my-zsh
#zplug "cbrock/sugar-free"
#zplug mafredri/zsh-async, from:github
#zplug sindresorhus/pure, use:pure.zsh, from:github, as:theme
zplug "agkozak/agkozak-zsh-prompt"
zplug "popstas/zsh-command-time"
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search"
zplug "MikeDacre/tmux-zsh-vim-titles"

# Utilities
zplug "supercrabtree/k"
zplug "hlissner/zsh-autopair"
zplug "MikeDacre/careful_rm"
zplug "ael-code/zsh-colored-man-pages"

# Language Helpers
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh
zplug "lukechilds/zsh-nvm"
zplug "pkulev/zsh-rustup-completion", defer:2
zplug "lukechilds/zsh-better-npm-completion", defer:2


# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

bindkey -v
export KEYTIMEOUT=1

ZSH_AUTOSUGGEST_USE_ASYNC="yes"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=4"

#PURE_PROMPT_SYMBOL="C❯"
#PURE_PROMPT_VICMD_SYMBOL="V❯"
AGKOZAK_BLANK_LINES=1
AGKOZAK_LEFT_PROMPT_ONLY=1

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

[[ $SHLVL != "2" ]] && (tmux attach || tmux new)
