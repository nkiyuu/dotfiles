DOT_DIRECTORY = $(shell pwd)
ZPREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms
DEIN_DIR = $(HOME)/.cache/dein
CONFIG_DIR = $(HOME)/.config
FISH_DIR = $(HOME)/.config/fish
NVIM_DIR = $(HOME)/.config/nvim

$(DEIN_DIR):
	mkdir -p $(DEIN_DIR)
	curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
	sh ./installer.sh $(DEIN_DIR)
	rm -f installer.sh

$(CONFIG_DIR):
	mkdir -p $(CONFIG_DIR)

$(NVIM_DIR): $(CONFIG_DIR)
	mkdir -p $(NVIM_DIR)

$(NVIM_DIR)/init.vim: $(NVIM_DIR)
	ln -sf $(DOT_DIRECTORY)/.vimrc $(NVIM_DIR)/init.vim

$(FISH_DIR): $(CONFIG_DIR)
	ln -sf $(DOT_DIRECTORY)/fish $(FISH_DIR)

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

$(HOME)/.zprezto:
	git clone --recursive https://github.com/sorin-ionescu/prezto.git $(HOME)/.zprezto

$(HOME)/.zpreztorc: $(HOME)/.zprezto
	ln -s $(ZPREZTO_RUNCOMS)/zpreztorc $(HOME)/.zpreztorc

$(NVIM_DIR)/dein.toml: $(DEIN_DIR)
	ln -sf $(DOT_DIRECTORY)/dein/dein.toml $@

$(NVIM_DIR)/dein_lazy.toml: $(DEIN_DIR)
	ln -sf $(DOT_DIRECTORY)/dein/dein_lazy.toml $@


$(HOME)/.%:
	ln -s $(DOT_DIRECTORY)/$(shell basename $@) $@

deploy_dotfiles: $(HOME)/.pyenv $(HOME)/.nodebrew $(HOME)/.gitconfig $(HOME)/.gitignore_global $(HOME)/.vimrc $(HOME)/.rbenv $(HOME)/.goenv $(HOME)/.vim $(HOME)/.zshrc $(HOME)/.zpreztorc $(NVIM_DIR)/init.vim $(NVIM_DIR)/dein.toml $(NVIM_DIR)/dein_lazy.toml

deploy: $(DEIN_DIR) $(FISH_DIR) deploy_dotfiles
