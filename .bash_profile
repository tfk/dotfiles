for file in ~/.{shellconfig,aliases,prompt,exports,functions}; do
	[ -r "$file" -a -f "$file" ] && source "$file";
done
