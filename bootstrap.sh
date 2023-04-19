#!/bin/sh
# See https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

function doSync() {
  rsync --exclude ".git/" \
        --exclude ".gitignore" \
        --exclude ".gitmodules" \
        --exclude ".DS_Store" \
        --exclude "README.md" \
        --exclude "bootstrap.sh" \
        --exclude ".vim/backup/*" \
        --exclude ".vim/tmp/*" \
        -avh --no-perms . ~;
}

cd "$(dirname "${BASH_SOURCE}")";

if [ which git ]; then
  echo "git not found";
  exit 1;
fi

if [ which rsync ]; then
  echo "rsync not found";
  exit 1;
fi


if [ "$1" == "--no-git" ]; then
  doSync;
else
  # Update from origin master
  git pull origin master 
  # Update submodules 
  git submodule init && git submodule update

  doSync;
fi
