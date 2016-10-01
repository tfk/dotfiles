#!/bin/sh

git submodule init && git submodule update

rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		-avh --no-perms . ~;

