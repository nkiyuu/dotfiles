DOT_DIRECTORY = $(shell pwd)
HOME_PREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms

submodule_init:
	git submodule update --recursive --init

install_pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv

install_nvm:
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

deploy_prezto: submodule_init deploy_dotfiles
	cd $(HOME_PREZTO_RUNCOMS); \
	for rcfile in *; do \
		if [ $$rcfile = "README.md"]; then continue; fi;\
		if [ $$rcfile = "zshrc" ]; then continue; fi;\
		ln -isnv $(HOME_PREZTO_RUNCOMS)/$$rcfile $(HOME)/.$$rcfile; \
	done

deploy_dotfiles: 
	-for f in .*; do \
		if [ $$f =  "." ]; then continue; fi;\
		if [ $$f = ".." ]; then continue; fi;\
		if [ $$f = ".gitignore" ]; then continue; fi;\
		if [ $$f = ".gitmodules" ]; then continue; fi;\
		ln -isnv $(DOT_DIRECTORY)/$$f $(HOME)/$$f; \
	done
	@echo $$(tput setaf 2)Deploy dotfiles complete!. ✔︎$$(tput sgr0)

deploy: deploy_prezto install_pyenv install_nvm
