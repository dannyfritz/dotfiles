if type -q nvim
    set -gx EDITOR nvim
end

if test -d $HOME/.config/astronvim
    set -gx NVIM_APPNAME astronvim
    alias astro="NVIM_APPNAME=astronvim nvim"
end

