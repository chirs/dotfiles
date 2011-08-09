
# if not running interactively, don't do anything
[ -z "$PS1" ] && return

case $OSTYPE in
    linux*)
        # linux specific

        # source the bash-completion file
        if [ -r "/etc/bash_completion" ]; then
            . "/etc/bash_completion"
        fi

        alias acs="sudo apt-cache search"
        alias acsh="sudo apt-cache show"
        alias agd="sudo apt-get dist-upgrade"
        alias agi="sudo apt-get install"
        alias agu="sudo apt-get update"
    ;;
    darwin*)
        # mac specific
        
        export LC_CTYPE="en_US.UTF-8"
        export LANG="en_US.UTF-8"
        export LANGUAGE="en_US.UTF-8"
        export LC_ALL="en_US.UTF-8"

        # homebrew python
        # export PYTHONPATH=/usr/local/lib/python2.6/site-packages
        # export PATH=/usr/local/Cellar/python/2.6.5/bin:$PATH

        # functions
        # function ls { command gls -Fh --color=auto "$@"; }
        # function manp { man -t "${1}" | open -f -a Preview; }

        # if [ -f `brew --prefix`/etc/bash_completion ]; then
        #  . `brew --prefix`/etc/bash_completion
        # fi

        # alias emacs="/Applications/Emacs.app/Contents/MacOS/Emacs -nw"

    ;;

    *)
    ;;
esac


# local should come first
export PATH=/usr/local/sbin:/usr/local/bin:$PATH

# add ~/bin to PATH if it exists
if [ -d "${HOME}/bin" ]; then
    export PATH=${HOME}/bin:$PATH
fi

# use virtualenvwrapper if available
[[ -f "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

# use rvm if available
[[ -s "/Users/chrisedgemon/.rvm/scripts/rvm" ]] && source "/Users/chrisedgemon/.rvm/scripts/rvm"

# source .private file if it's available.
[[ -f "${HOME}/.private" ]] && source "${HOME}/.private"


# erase duplicate lines from the history; ignore lines that begin with a space
HISTCONTROL=erasedups:ignorespace
HISTSIZE=100000
HISTFILESIZE=100000

# append to history rather than overwriting
shopt -s histappend

# don't try to complete on nothing
shopt -s no_empty_cmd_completion

export EDITOR="emacs"
export EMAIL="chrisedgemon@gmail.com"

# prompt before removing or overwriting files
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

# prompt colors
BGREEN='\[\033[1;32m\]'
GREEN='\[\033[0;32m\]'
BRED='\[\033[1;31m\]'
RED='\[\033[0;31m\]'
BBLUE='\[\033[1;34m\]'
BLUE='\[\033[0;34m\]'
NORMAL='\[\033[00m\]'

# Command line colors - need to improve.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad