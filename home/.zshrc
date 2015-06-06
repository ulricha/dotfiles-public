# Path to your oh-my-zsh installation.
export ZSH=$HOME/.homesick/repos/oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git cabal)

source $ZSH/oh-my-zsh.sh

# User configuration

bindkey -v

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='emacs -nw'
else
  export EDITOR='emacs -nw'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export TERM=xterm-256color

################################################################################
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

################################################################################
# ghc-config

export GHC_DISTRIBUTION_DIR=/home/au/software/ghc
export GHC_CONFIG_DIR=/home/au/.ghc-config
export CABAL_USER_DIR=/home/au/.cabal

################################################################################
# Paths
export PATH=$HOME/.cabal/bin:$PATH
export PATH=$HOME/software/tor:$PATH
export PATH=$HOME/software/tom-2.7:$PATH
export PATH=$HOME/software/x100/bin:$PATH
export PATH=$HOME/software/isync-1.1.0/bin:$PATH
export PATH=$HOME/software/notmuch-0.18.1/bin:$PATH
export PATH=$HOME/software/racket/bin:$PATH

export PATH=$GHC_DISTRIBUTION_DIR/bin:$PATH
export PATH=$GHC_CONFIG_DIR/ghc/bin:$PATH
export PATH=$CABAL_USER_DIR/bin:$PATH

#ghc-config -i

source "$HOME/.homesick/repos/homeshick/homeshick.sh"
