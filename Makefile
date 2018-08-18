DOT_DIRECTORY = $(shell pwd)
HOME_PREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms
DEIN_DIR = $(HOME)/.cache/dein

submodule_init:
	git submodule update --recursive --init

$(DEIN_DIR):
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh $(DEIN_DIR)
	rm -f installer.sh

$(HOME)/.pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

$(HOME)/.nvm: 
	mkdir $(HOME)/.nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

deploy_prezto: submodule_init deploy_dotfiles
	-cd $(HOME_PREZTO_RUNCOMS); \
	for rcfile in *; do \
		if [ $$rcfile = "README.md" ]; then continue; fi;\
		if [ $$rcfile = "zshrc" ]; then continue; fi;\
		ln -isnv $(HOME_PREZTO_RUNCOMS)/$$rcfile $(HOME)/.$$rcfile; \
	done

deploy_dotfiles: 
	-for f in .*; do \
		if [ $$f =  "." ]; then continue; fi;\
		if [ $$f = ".." ]; then continue; fi;\
		if [ $$f = ".git" ]; then continue; fi;\
		if [ $$f = ".gitignore" ]; then continue; fi;\
		if [ $$f = ".gitmodules" ]; then continue; fi;\
		ln -isnv $(DOT_DIRECTORY)/$$f $(HOME)/$$f; \
	done
	@echo $$(tput setaf 2)Deploy dotfiles complete!. ✔︎$$(tput sgr0)

deploy: deploy_prezto $(HOME)/.pyenv $(HOME)/.nvm $(DEIN_DIR)
