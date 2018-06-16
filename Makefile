DOT_DIRECTORY = $(shell pwd)
HOME_PREZTO_RUNCOMS = $(HOME)/.zprezto/runcoms

submodule_init:
	git submodule update --recursive --init

deploy_prezto: submodule_init deploy_dotfiles
	cd $(HOME_PREZTO_RUNCOMS); \
	for rcfile in *; do \
		[[ $$rcfile = "README.md" ]] && continue; \
		[[ $$rcfile = "zshrc" ]] && continue; \
		ln -isnv $(HOME_PREZTO_RUNCOMS)/$$rcfile $(HOME)/.$$rcfile; \
	done

deploy_dotfiles: 
	-for f in .*; do \
		[[ $$f = "." ]] && continue; \
		[[ $$f = ".." ]] && continue; \
		[[ $$f = ".gitignore" ]] && continue; \
		[[ $$f = ".gitignore" ]] && continue; \
		[[ $$f = ".gitmodules" ]] && continue; \
		ln -isnv $(DOT_DIRECTORY)/$$f $(HOME)/$$f; \
	done
	@echo $$(tput setaf 2)Deploy dotfiles complete!. ✔︎$$(tput sgr0)

deploy: deploy_prezto