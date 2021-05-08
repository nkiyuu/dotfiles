DOT_DIRECTORY = $(shell pwd)
ZPREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms
DEIN_DIR = $(HOME)/.cache/dein
FISH_DIR = $(HOME)/.config/fish

$(DEIN_DIR):
	mkdir -p $(DEIN_DIR)
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh $(DEIN_DIR)
	rm -f installer.sh

$(FISH_DIR):
	ln -s $(DOT_DIRECTORY)/fish $(FISH_DIR)

$(HOME)/.nodebrew:
	curl -L git.io/nodebrew | perl - setup

$(HOME)/.pyenv:
	git clone https://github.com/pyenv/pyenv.git $(HOME)/.pyenv
	git clone https://github.com/yyuu/pyenv-virtualenv.git ~/.pyenv/plugins/pyenv-virtualenv

$(HOME)/.goenv:
	git clone https://github.com/syndbg/goenv.git $(HOME)/.goenv

$(HOME)/.rbenv:
	git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
	git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

$(HOME)/.goenv:
	git clone https://github.com/syndbg/goenv.git ~/.goenv

$(HOME)/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto

$(HOME)/.zpreztorc: $(HOME)/.zprezto
	ln -s $(ZPREZTO_RUNCOMS)/zpreztorc $(HOME)/.zpreztorc

$(HOME)/.%:
	ln -s $(DOT_DIRECTORY)/$(shell basename $@) $@

deploy_dotfiles: $(HOME)/.pyenv $(HOME)/.nodebrew $(HOME)/.goenv $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.vimrc $(HOME)/.rbenv $(HOME)/.goenv $(HOME)/.vim $(HOME)/.zshrc $(HOME)/.zpreztorc

deploy: $(DEIN_DIR) $(FISH_DIR) deploy_dotfiles
