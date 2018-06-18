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

# 各環境のセッティング 
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
# rust 
export PATH=$PATH:$HOME/.cargo/bin
# tmux
export TMUX_TMPDIR=/tmp
# Google Cloud SDK
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/y-nozaki/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/y-nozaki/Downloads/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/y-nozaki/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/y-nozaki/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# alias
# clでターミナルクリア
alias cl='clear'
# gコマンドでpecoを使ってローカルリポジトリに移動
alias g='cd $(ghq root)/$(ghq list | peco)'
# hgコマンドでリモートリポジトリに移動
alias gh='hub browse $(ghq list | peco | cut -d "/" -f 2,3)'

# その他
# peco用
# [ ctrl + ] ]でcdできる
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
# Ctrl+r でコマンド履歴
function peco-select-history() {
  # historyを番号なし、逆順、最初から表示。
  # 順番を保持して重複を削除。
  # カーソルの左側の文字列をクエリにしてpecoを起動
  # \nを改行に変換
  BUFFER="$(history -nr 1 | awk '!a[$0]++' | peco --query "$LBUFFER" | sed 's/\\n/\n/')"
  CURSOR=$#BUFFER             # カーソルを文末に移動
  zle -R -c                   # refresh
}
zle -N peco-select-history
bindkey '^R' peco-select-history

