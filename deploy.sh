#!/bin/bash
DOT_DIRECTORY="${HOME}/dotfiles"

for f in .??*
do
  # ここに無視するファイルを書いていく
  [[ ${f} = ".git" ]] && continue
  [[ ${f} = ".gitignore" ]] && continue
  [[ ${f} = "deploy.sh" ]] && continue
  [[ ${f} = "README.md" ]] && continue
  [[ ${f} = ".gitmodules" ]] && continue

  ln -isnv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
done
echo $(tput setaf 2)Deploy dotfiles complete!. ✔︎$(tput sgr0)
