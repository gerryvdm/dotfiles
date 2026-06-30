ZSH_CUSTOM ?= $(HOME)/.oh-my-zsh/custom
GIT_USER_EMAIL := $(shell git config user.email)
GIT_USER_NAME  := $(shell git config user.name)

.PHONY: help install brew containers node intelephense
.DEFAULT_GOAL := help

help:
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*## "} {printf "  %-14s %s\n", $$1, $$2}'

install: brew node containers ## Install everything and link config
	mkdir -p "$(ZSH_CUSTOM)"
	ln -sfn "$(CURDIR)/.oh-my-zsh/custom/dotfiles.zsh" "$(ZSH_CUSTOM)/dotfiles.zsh"
	mkdir -p "$(HOME)/.claude"
	ln -sfn "$(CURDIR)/agents" "$(HOME)/.claude/agents"

brew: ## Install Homebrew
	bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

node: brew ## Install Node.js
	brew install node

intelephense: ## Install the intelephense language server
	npm install -g intelephense

containers: ## Build the phpdev Docker image
	docker build \
	  --no-cache --pull \
      --build-arg GIT_USER_EMAIL="$(GIT_USER_EMAIL)" \
      --build-arg GIT_USER_NAME="$(GIT_USER_NAME)" \
	  -t phpdev "$(CURDIR)/docker/phpdev"
