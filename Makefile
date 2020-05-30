DOT_DIRECTORY = $(shell pwd)
ZPREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms
DEIN_DIR = $(HOME)/.cache/dein

$(DEIN_DIR):
	mkdir -p $(DEIN_DIR)
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh $(DEIN_DIR)
	rm -f installer.sh

$(HOME)/.pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

$(HOME)/.nvm:
	mkdir $(HOME)/.nvm
	curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

$(HOME)/.goenv:
	git clone https://github.com/syndbg/goenv.git $(HOME)/.goenv

$(HOME)/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto

$(HOME)/.zpreztorc: $(HOME)/.zprezto
	ln -s $(ZPREZTO_RUNCOMS)/zpreztorc $(HOME)/.zpreztorc

$(HOME)/.rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

@(HOME)/.goenv:
	git clone https://github.com/syndbg/goenv.git ~/.goenv

$(HOME)/.%:
	ln -s $(DOT_DIRECTORY)/$(shell basename $@) $@

deploy_dotfiles: $(HOME)/.pyenv $(HOME)/.nvm $(HOME)/.goenv $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.vimrc $(HOME)/.zshrc $(HOME)/.zpreztorc $(HOME)/.rbenv $(HOME)/.goenv $(HOME)/.vim $(HOME)/.tmux.conf

deploy: $(DEIN_DIR) deploy_dotfiles
