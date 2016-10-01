DOTFILES=$HOME/dotfiles/
for file in .shellconfig .aliases .prompt .exports functions; do
	file=$DOTFILES"$file"
	[ -r "$file" -a -f "$file" ] && source "$file";
done
