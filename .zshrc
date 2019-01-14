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

zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/debian", from:oh-my-zsh

zplug "supercrabtree/k"
#zplug "zpm-zsh/ls"
zplug "hlissner/zsh-autopair"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "MikeDacre/careful_rm"
zplug "ael-code/zsh-colored-man-pages"
zplug "popstas/zsh-command-time"

zplug "lukechilds/zsh-nvm"
#zplug "akoenig/npm-run.plugin.zsh"
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "pkulev/zsh-rustup-completion"

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

#alias ls='ls --color=auto'

[[ $SHLVL != "2" ]] && (tmux attach || tmux new)
