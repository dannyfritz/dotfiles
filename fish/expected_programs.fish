if status --is-interactive
    if test -z $TMUX
        tmux
        exit 0
    end
    set --erase expected_programs
    set -a expected_programs asdf\;https://asdf-vm.com
    set -a expected_programs bat\;https://github.com/sharkdp/bat
    set -a expected_programs cowsay\;https://github.com/tnalpgge/rank-amateur-cowsay
    set -a expected_programs delta\;https://github.com/dandavison/delta
    set -a expected_programs entr\;https://github.com/eradman/entr
    set -a expected_programs fd\;https://github.com/sharkdp/fd
    set -a expected_programs figlet\;http://www.figlet.org
    # set -a expected_programs fish\;https://fishshell.com/
    set -a expected_programs fortune\;http://bxr.su/OpenBSD/games/fortune
    set -a expected_programs fzf\;https://github.com/junegunn/fzf
    set -a expected_programs gitui\;https://github.com/extrawurst/gitui
    set -a expected_programs glow\;https://github.com/charmbracelet/glow
    set -a expected_programs htop\;https://htop.dev
    set -a expected_programs jq\;https://github.com/jqlang/jq
    set -a expected_programs lsd\;https://github.com/lsd-rs/lsd
    set -a expected_programs noti\;https://github.com/variadico/noti
    set -a expected_programs nvim\;https://neovim.io
    set -a expected_programs rg\;https://github.com/BurntSushi/ripgrep
    set -a expected_programs sox\;https://sox.sourceforge.net
    set -a expected_programs starship\;https://starship.rs
    set -a expected_programs tmux\;https://github.com/tmux/tmux
    set -a expected_programs utimer\;https://launchpad.net/utimer
    set -a expected_programs yazi\;https://yazi-rs.github.io
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

