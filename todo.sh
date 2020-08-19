#!/usr/bin/env bash

DATE_TODAY=$(date +'%A, %d %B %Y')
TODO="$HOME/todo"
TODO_FILE="$TODO/todo.txt"

if [ "$1" == "priv" ]; then
  TODO_FILE="$TODO/todo_priv.txt"
fi

mkdir -p $TODO

if ! ls -a $TODO | grep -q .git; then
	git clone https://github.com/antoniszczepanik/todo.git $TODO
fi

# If there's not todays date in a file try pulling
if ! cat $TODO_FILE | grep -q "$DATE_TODAY"; then
	cd $TODO && git pull && cd -
fi

# Try once again and if still not append it
if ! cat $TODO_FILE | grep -q "$DATE_TODAY"; then
	echo >> $TODO_FILE
	echo "$DATE_TODAY" >> $TODO_FILE
	echo "===========================">> $TODO_FILE
	echo >> $TODO_FILE
fi

vim + $TODO_FILE && cd $TODO && git add -A && git commit -m 'update' > /dev/null

# if commit made succesfully push in background
[ $? -eq 0 ] && git push </dev/null &>/dev/null &
