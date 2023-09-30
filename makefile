SHELL := /bin/bash
.SHELLFLAGS = -e -c
.SILENT:
.ONESHELL:

.EXPORT_ALL_VARIABLES:

.DEFAULT_GOAL: help

.PHONY: help
help:
	@echo "Please use 'make <target>' where <target> is one of"
	@grep -E '^\.PHONY: [a-zA-Z_-]+ .*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = "(: |##)"}; {printf "\033[36m%-30s\033[0m %s\n", $$2, $$3}'

.PHONY: install ## 🏁 Installe les dépendances
install:
	npm install

.PHONY: build ## 📦 Build le code
build:
	npm run build

.PHONY: start-sandbox ## 📦 Lance la sandbox dans un docker
start-sandbox:
	docker-compose run --rm --build -p 7777:80 instance bash

.PHONY: start-watch-mode ## 👀 Lance un watch mode sur PM2
start-watch-mode:
	npx pm2 start all --watch true

