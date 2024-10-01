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
        printf "\tnb\t\talias to \"nb open\"\n"
        printf "\tnb open\t\tOpen nvim\n"
        printf "\tnb sync\t\tOpen gitui\n"
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
        __nbhelp
        return 1
    end
end
