# loads aliases and functions
for file in $DOT_FILES/{aliases,functions}.sh; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
