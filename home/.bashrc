# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

source "$HOME/.homesick/repos/homeshick/homeshick.sh"

#export TERM=xterm-256color

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export EDITOR=vim

# X100 compilation settings
# A root directory for the X100 sources, will contain e.g.
# $SRCS/buildtools, $SRCS/x100 and more
export SRCS=$HOME/work/dev

# A directory where compilation files are stored
export BUILD=$HOME/work/dev/x100_build

# Installation directory. All files will be created in:
# - $PREFIX/monet-bt      : buildtools
# - $PREFIX/x100-*-*-*   : various installations
# - $PREFIX/x100         : link to the active installation
export PREFIX=$HOME/software

# These are automatic based on above
export BUILDTOOLS_PREFIX=$PREFIX/monet-bt
export BIN_PREFIX=$PREFIX/bin
export X100_PREFIX=$PREFIX/x100
export PATH=$PATH:$BIN_PREFIX:$X100_PREFIX/bin:$BUILDTOOLS_PREFIX/bin
export PYTHONPATH=$BUILDTOOLS_PREFIX/`python -c 'import distutils.sysconfig; print distutils.sysconfig.get_python_lib(0,0,"")'`:$BUILDTOOLS_PREFIX/lib/python2.7/site-packages
export X100COMPILE=$SRCS/x100/x100compile
# This two are necessary for the later compilation/running of Ingres
export LDLIBX100="-L$X100_PREFIX/lib -lx100client"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$X100_PREFIX/lib"

export GHC_DISTRIBUTION_DIR=/home/au/software/ghc
export GHC_CONFIG_DIR=/home/au/.ghc-config
export CABAL_USER_DIR=/home/au/.cabal

export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/software/tor:$PATH
export PATH=$HOME/software/tom-2.7:$PATH
export PATH=$HOME/software/x100/bin:$PATH
#export PATH=$HOME/software/ghc-7.6.3/bin:$PATH
export PATH=$HOME/software/isync-1.1.0/bin:$PATH
export PATH=$HOME/software/notmuch-0.16/bin:$PATH
#export PATH=$HOME/software/postgres-git/bin:$PATH

# export PATH=$HOME/ghc/ghc/bin:$PATH
export PATH=$GHC_DISTRIBUTION_DIR/bin:$PATH
export PATH=$GHC_CONFIG_DIR/ghc/bin:$PATH
export PATH=$CABAL_USER_DIR/bin:$PATH

ghc-config -i
