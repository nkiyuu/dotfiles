#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# setting for each language 
# golang
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin:$GOPATH/bin
export PATH=$PATH:/usr/lib/go-1.8/bin
# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH
# nvm
export NVM_DIR="$HOME/.nvm"
if [[ -s ~/.nvm/nvm.sh ]];
  then source ~/.nvm/nvm.sh
fi
# android
export PATH=$HOME/Library/Android/sdk/tools:$PATH
export PATH=$HOME/Library/Android/sdk/platform-tools:$PATH
export PATH=$HOME/Android/sdk/tools:$PATH
export PATH=$HOME/Android/sdk/platform-tools:$PATH
# rust 
export PATH=$PATH:$HOME/.cargo/bin
# tmux
export TMUX_TMPDIR=/tmp
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/y-nozaki/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/y-nozaki/google-cloud-sdk/path.zsh.inc'; fi
# Google Cloud SDK# The next line enables shell command completion for gcloud.
if [ -f '/Users/y-nozaki/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/y-nozaki/google-cloud-sdk/completion.zsh.inc'; fi
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kiyuu/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/kiyuu/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/kiyuu/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/kiyuu/google-cloud-sdk/completion.zsh.inc'; fi
# goapp
export PATH=$PATH:$HOME/google-cloud-sdk/platform/google_appengine/goroot-1.9/bin
# composer0
export PATH=$PATH:$HOME/.composer/vendor/bin

# alias
# cl terminal clear
alias cl='clear'
# g move to local repository by peco
alias g='cd $(ghq root)/$(ghq list | peco)'
# hg move to remote repository by peco
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# others
# for peco
# [ ctrl + ] ] cd
function peco-src () {  
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")  
  if [ -n "$selected_dir" ]; then    
    BUFFER="cd ${selected_dir}"    
    zle accept-line  
  fi  
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
# Ctrl+r command history
function peco-select-history() {
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER             
  zle -R -c                   
}
zle -N peco-select-history
bindkey '^R' peco-select-history
export PATH="/usr/local/opt/gettext/bin:$PATH"
