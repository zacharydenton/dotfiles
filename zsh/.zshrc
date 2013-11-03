# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git archlinux gem pip rails3 extract python django lscolors)

source $ZSH/oh-my-zsh.sh

# PATH modifications
PATH=$HOME/.cabal/bin:$PATH
PATH=$(ruby -rubygems -e "puts Gem.user_dir")/bin:$PATH
PATH="/usr/local/heroku/bin:$PATH"
PATH=$HOME/bin:$PATH

# CTRL-r search in vi-mode
bindkey '^r' history-incremental-search-backward

# Miscellaneous
alias tmux="tmux -2"
alias clojure="java -jar $CLOJURE_HOME/clojure.jar"
alias bget="wget --content-disposition --header='Cookie:id=cmv12mrH0C4qfZmB%2BKTrAr91mCnA2ytNLx0p9TP4HUns3O5KPyQA9owtB0PRVg%2BgqYDjdNmN2Gf2MOaPR0f6zbgG2NebGzTuJ5SSCmbamyc%3D'"
alias pc="packer-color --noedit"
export EDITOR=vim
