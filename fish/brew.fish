# https://docs.brew.sh/Shell-Completion#configuring-completions-in-fish
if test -e /opt/homebrew/bin/brew
    fish_add_path -gpPm /opt/homebrew/bin /opt/homebrew/sbin/
    eval "$(/opt/homebrew/bin/brew shellenv)"
end
if test -e /home/linuxbrew/.linuxbrew/bin/brew
    fish_add_path -gpPm "/home/linuxbrew/.linuxbrew/bin" "/home/linuxbrew/.linuxbrew/sbin"
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
end
if type -q brew; and test -d (brew --prefix)/share/fish/completions
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end
if type -q brew; and test -e (brew --prefix)/share/fish/vendor_completions.d
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end
if type -q brew; and test -e (brew --prefix)/opt/asdf/libexec/asdf.fish
    source (brew --prefix)/opt/asdf/libexec/asdf.fish
else if test -d ~/.asdf/asdf.fish
    source ~/.asdf/asdf.fish
end
