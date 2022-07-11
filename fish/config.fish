# Disable Greeting
set fish_greeting ''

# PATH
set PATH ~/.local/bin $PATH

# Commands to run in interactive sessions can go here
if status is-interactive

    # Disable the historyfile for less
    set LESSHISTSIZE 0
    set LESSHISTFILE '/dev/null'

    # Ensure that one-dark colorscheme is enabled
    if command -v onedark_options >/dev/null
    	set_onedark -b
    end

    # Aliases
    alias mv 'mv -i'
    alias cp 'cp -ir'
    alias rm 'rm -ir'
    alias mkdir 'mkdir -p'
    alias grep 'grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
    alias ... 'cd ../..'
    alias .... 'cd ../../..'
    alias wget 'wget --hsts-file /dev/null'

    alias m 'make'
    alias t 'tmux'
    alias g 'git'

    # Neovim
    if command -v nvim >/dev/null
        set EDITOR nvim
        alias n nvim
        alias vi nvim
        alias vim nvim
    end

    # FZF
    if command -v fzf >/dev/null
        set FZF_DEFAULT_OPTS '--filepath-word --layout=reverse-list --color=bg+:-1,pointer:-1,gutter:bg'
    end

    # Use direnv
    if command -v direnv > /dev/null
        eval (direnv hook fish)
    end

    # Replace ls with exa
    if command -v exa >/dev/null
        alias ls 'exa'
        alias ll 'exa -l'
        alias la 'exa -la'
    end

    # WSL specific settings
    if test -n $WSL_DISTRO_NAME

        if command -v xdg-open >/dev/null
            alias o 'xdg-open'
            alias open 'xdg-open'
        end

    end
end

# Conda init    
eval /home/duktus/.miniconda/bin/conda "shell.fish" "hook" $argv | source