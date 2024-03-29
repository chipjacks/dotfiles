#!/usr/bin/env bash

# FROM - https://github.com/mathiasbynens/dotfiles/blob/main/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function dryRun() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "git-completion.bash" \
		--exclude "git-completion.zsh" \
		-avh --no-perms --dry-run . ~;
}

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "git-completion.bash" \
		--exclude "git-completion.zsh" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	dryRun;
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
