function nb -d "Modify and sync the notebook"
    set -l LOCATION ~/notebook
    function __nbhelp -V LOCATION
        set_color normal
        printf "Modify and sync $LOCATION\n\n"
        set_color -o brwhite
        printf "USAGE:\n"
        set_color normal
        printf "\tnb [COMMAND]\n\n"
        set_color -o brwhite
        printf "COMMANDS:\n"
        set_color normal
        printf "\tnb                            "
        set_color -d
        printf "Alias to \"nb open\"\n"
        set_color normal
        printf "\tnb open                       "
        set_color -d
        printf "Open nvim\n"
        set_color normal
        printf "\tnb sync                       "
        set_color -d
        printf "Open gitui\n"
        set_color normal
        printf "\tnb q [SEARCH_TERM]            "
        set_color -d
        printf "Alias to \"nb query\"\n"
        set_color normal
        printf "\tnb query [SEARCH_TERM]        "
        set_color -d
        printf "Search using ripgrep\n"
        set_color normal
    end
    if not test -e $LOCATION;
        and not test -d $LOCATION
        set_color yellow
        echo "No directory found at \"$LOCATION\"!"
        set_color normal
        return 1
    end
    set -l OPTION $(string split " " $argv)[1]
    if test -z $OPTION;
        or test $OPTION = open
        if not type -q nvim
            set_color yellow
            echo "Missing \"nvim\" command!"
            set_color normal
            return 1
        end
        command nvim --cmd "cd $LOCATION"
        return 0
    else if test "$OPTION" = sync
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
    else if test "$OPTION" = query
        or test $OPTION = q
        if not type -q rg
            set_color yellow
            echo "Missing \"rg\" command!"
            set_color normal
            return 1
        end
        set -l SEARCH $(string split " " $argv)[2..-1]
        command rg $SEARCH $LOCATION
        return 0
    else if test "$OPTION" = todo
        if not type -q rg
            set_color yellow
            echo "Missing \"rg\" command!"
            set_color normal
            return 1
        end
        # command rg -e "(-\s?\[\s?])|(-\s?\[[xX]])" $LOCATION/Project $LOCATION/Area
        command rg -e "-\s?\[\s?]" $LOCATION/Project $LOCATION/Area
        return 0
    else
        set_color yellow
        printf 'Unknown COMMAND: "%s"\n\n' $argv
        __nbhelp
        return 1
    end
end
