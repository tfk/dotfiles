for file in ~/.{aliases,prompt,exports,functions,extra}; do
	[ -r "$file" -a -f "$file" ] && source "$file";
done

# case-insensitive globbing 
shopt -s nocaseglob

# append to the history file
shopt -s histappend

# autocorrect typos in path names when using cd
shopt -s cdspell

# Fix ctrl+s in reverse-i-search
stty -ixon

# complete only directories when using cd
complete -d cd

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# If possible, add tab completion for many more commands
if [ "$(uname -s)" == "Darwin" ] &&  which brew &>/dev/null; then
    [ -f "$(brew --prefix)/etc/bash_completion" ] && source "$(brew --prefix)/etc/bash_completion"
else
  if [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
  elif [ -f /usr/share/bash-completion/bash_completion ]; then
    source /usr/share/bash-completion/bash_completion;
  fi
fi

