#!/bin/sh
# See https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

# Update from origin master
git pull origin master 

# Update submodules 
git submodule init && git submodule update
 
rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude ".DS_Store" \
      --exclude "README.md" \
      --exclude "bootstrap.sh" \
      --exclude ".vim/backup/*" \
      --exclude ".vim/tmp/*" \
      -avh --no-perms . ~;


