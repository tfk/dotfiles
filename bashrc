DOTFILES=$HOME/dotfiles/
for file in aliases prompt; do
	file=$DOTFILES"$file"
	[ -r "$file" -a -f "$file" ] && source "$file";
done
