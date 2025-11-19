ZSH_CUSTOM ?= $(HOME)/.oh-my-zsh/custom
GIT_USER_EMAIL := $(shell git config user.email)
GIT_USER_NAME  := $(shell git config user.name)

.PHONY: install containers

install: containers
	mkdir -p "$(ZSH_CUSTOM)"
	ln -sfn "$(PWD)/.oh-my-zsh/custom/dotfiles.zsh" "$(ZSH_CUSTOM)/dotfiles.zsh"

containers:
	docker build \
	  --no-cache --pull \
      --build-arg GIT_USER_EMAIL="$(GIT_USER_EMAIL)" \
      --build-arg GIT_USER_NAME="$(GIT_USER_NAME)" \
	  -t phpdev "$(PWD)/docker/phpdev"
