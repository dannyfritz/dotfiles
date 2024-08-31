if test -e ~/notebook
    alias nb="nvim --cmd \"cd ~/notebook\""
    if type -q gitui
        alias nb-sync="gitui --directory ~/notebook"
    end
end
