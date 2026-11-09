# ~/.bashrc: executed by bash(1) for non-login shells.

export EDITOR=nano

if [ -d "$HOME/.local/share/bin" ]; then
    export PATH=$PATH:$HOME/.local/share/bin
fi

# stop if not running interactively
case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

shopt -s histappend
shopt -s cmdhist

# check the window size after each command and, if necessary, update the values of LINES and COLUMNS.
shopt -s checkwinsize

# check for basic color support
case "$TERM" in
    xterm-color|*-256color) color_support=true;;
    *) if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then color_support=true; fi;;
esac

if [ "$color_support" = true ]; then
    PS1='[${debian_chroot:+($debian_chroot)}\[\e[01;32m\]\u@\h\[\e[00m\]:\[\e[01;34m\]\w\[\e[00m\]]\$ '
else
    PS1='[${debian_chroot:+($debian_chroot)}\u@\h:\w]\$ '
fi

unset color_support

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias make='make -j4'

# exports
export GOPATH=$HOME/.go

if [ -d "$HOME/Utilities/go/bin" ]; then
    export PATH=$PATH:$HOME/Utilities/go/bin
fi

if ! shopt -oq posix; then
    if [ -z "${BASH_COMPLETION_VERSINFO:-}" ] && [ -f /usr/share/bash-completion/bash_completion ] && [ -r /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    fi
fi
