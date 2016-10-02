for file in ~/.{shellconfig,aliases,prompt,exports,functions}; do
	[ -r "$file" -a -f "$file" ] && source "$file";
done

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


