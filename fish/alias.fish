# abbr
# cl terminal clear
abbr cl 'clear'
# g move to local repository by peco
abbr g 'cd $(ghq root)/$(ghq list | peco)'
# hg move to remote repository by peco
abbr gh 'hub browse $(ghq list | peco | cut -d "/" -f 2,3)'
## git
# git checkout
abbr gco "git checkout"
abbr gsw "git switch"
abbr gcb 'gco $(git for-each-ref --format="%(authorname) %09 %(refname:short)" --sort=authorname | sed "/origin/d" | peco | awk "{print \$NF}")'
abbr vim "goneovim"
abbr gg "git grep --break --heading"
