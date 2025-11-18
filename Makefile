ZSH_CUSTOM ?= $(HOME)/.oh-my-zsh/custom

.PHONY: install containers

install: containers
	mkdir -p "$(ZSH_CUSTOM)"
	ln -sfn "$(PWD)/.oh-my-zsh/custom/dotfiles.zsh" "$(ZSH_CUSTOM)/dotfiles.zsh"

containers:
	docker build --no-cache --pull -t phpdev "$(PWD)/docker/phpdev"
