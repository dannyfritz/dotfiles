if status --is-interactive
    set -l -a expected_programs asdf\;https://asdf-vm.com
    set -l -a expected_programs bat\;https://github.com/sharkdp/bat
    set -l -a expected_programs btop\;https://github.com/aristocratos/btop
    set -l -a expected_programs delta\;https://github.com/dandavison/delta
    set -l -a expected_programs entr\;https://github.com/eradman/entr
    set -l -a expected_programs fd\;https://github.com/sharkdp/fd
    set -l -a expected_programs figlet\;http://www.figlet.org
    set -l -a expected_programs fish\;https://fishshell.com/ # silly check within fish. whatever
    set -l -a expected_programs fortune\;http://bxr.su/OpenBSD/games/fortune
    set -l -a expected_programs fzf\;https://github.com/junegunn/fzf
    set -l -a expected_programs gitui\;https://github.com/extrawurst/gitui
    set -l -a expected_programs glow\;https://github.com/charmbracelet/glow
    set -l -a expected_programs jq\;https://github.com/jqlang/jq
    set -l -a expected_programs lsd\;https://github.com/lsd-rs/lsd
    set -l -a expected_programs noti\;https://github.com/variadico/noti
    set -l -a expected_programs nvim\;https://neovim.io
    set -l -a expected_programs rg\;https://github.com/BurntSushi/ripgrep
    set -l -a expected_programs sox\;https://sox.sourceforge.net
    set -l -a expected_programs starship\;https://starship.rs
    set -l -a expected_programs tmux\;https://github.com/tmux/tmux
    set -l -a expected_programs utimer\;https://launchpad.net/utimer
    set -l -a expected_programs yazi\;https://yazi-rs.github.io
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
                end
            end
        end
    end
    set_color normal
end

