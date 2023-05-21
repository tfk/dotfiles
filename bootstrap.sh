#!/bin/sh
# See https://github.com/mathiasbynens/dotfiles/blob/master/bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";

which git >/dev/null
if [ $? -ne 0 ]; then
  echo "git not found";
  exit 1;
fi

which rsync >/dev/null
if [ $? -ne 0 ]; then
  echo "rsync not found";
  exit 1;
fi


if [ "$1" != "--no-git" ]; then
  # Update from origin master
  git pull origin master 
  # Update submodules 
  git submodule init && git submodule update
fi

rsync --exclude ".git/" \
      --exclude ".gitignore" \
      --exclude ".gitmodules" \
      --exclude ".DS_Store" \
      --exclude "README.md" \
      --exclude "bootstrap.sh" \
      --exclude ".vim/backup/*" \
      --exclude ".vim/tmp/*" \
      -avh --no-perms . ~;
