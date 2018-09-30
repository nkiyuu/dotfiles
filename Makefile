DOT_DIRECTORY = $(shell pwd)
ZPREZTO_RUNCOMS = $(DOT_DIRECTORY)/.zprezto/runcoms
DEIN_DIR = $(HOME)/.cache/dein

$(DEIN_DIR):
	mkdir $(DEIN_DIR)
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh $(DEIN_DIR)
	rm -f installer.sh

$(HOME)/.pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

$(HOME)/.nvm: 
	mkdir $(HOME)/.nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

$(HOME)/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto

$(HOME)/.%:
	ln -s $(DOT_DIRECTORY)/$(shell basename $@) $@ || ln -s $(ZPREZTO_RUNCOMS
	)/$(shell basename $@) $@

deploy_dotfiles: $(HOME)/.pyenv $(HOME)/.nvm $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.vimrc $(HOME)/.zshrc $(HOME)/.zprezto $(HOME)/.zpreztorc

deploy: $(DEIN_DIR) deploy_dotfiles
