# setting for each language
# golang
set -x GOPATH $HOME/go
set -x PATH $PATH /usr/local/opt/go/libexec/bin $GOPATH/bin
set -x PATH $PATH /usr/lib/go-1.8/bin
# goenv
set -x PATH $PATH $HOME/.goenv/bin
set -x GOENV_DISABLE_GOPATH 1
eval (goenv init - | source)
# pyenv
set -x PYENV_ROOT $HOME/.pyenv
set -x PATH  $PATH $PYENV_ROOT/bin
eval (pyenv init - | source)
eval (pyenv virtualenv-init - | source)
# nodebrew
set -x PATH $PATH $HOME/.nodebrew/current/bin
#rbenv
set -x PATH $PATH $HOME/.rbenv/bin
eval (rbenv init - | source)
# java
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
# android
set -x PATH $PATH $HOME/Library/Android/sdk/tools
set -x PATH $PATH $HOME/Library/Android/sdk/platform-tools
set -x PATH $PATH $HOME/Android/sdk/tools
set -x PATH $PATH $HOME/Android/sdk/platform-tools
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT $HOME/Library/Android/sdk
# gradle
set -x PATH $PATH /Applications/Android\ Studio.app/Contents/gradle/gradle-4.6/bin
# rust
set -x PATH $PATH $HOME/.cargo/bin
# composer
set -x PATH $PATH $HOME/.composer/vendor/bin
# Language Server Protocol
set -x PATH $PATH $HOME/.local/share/vim-lsp-settings/servers/typescript-language-server
# flutter bin
set -x PATH $PATH $HOME/flutter/bin
# Google Cloud SDK.
if [ -f $HOME/google-cloud-sdk/path.fish.inc ]; . $HOME/google-cloud-sdk/path.fish.inc; end

# abbr
# cl terminal clear
abbr cl "clear"
# g move to local repository by peco
abbr g "cd (ghq root)/(ghq list | peco)"
# hg move to remote repository by peco
abbr gh "hub browse (ghq list | peco | cut -d "/" -f 2,3)"
## git
# git checkout
abbr gco "git checkout"
abbr gsw "git switch"
abbr vim "nvim"

# plugin setting
function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end
