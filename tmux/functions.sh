#!/bin/bash

tm_main() {
	tmux new -s main -d
	tmux split-window -h -t main
	tmux split-window -v -t main
	tmux attach -t main
}

tm_nv() {
	dir=${PWD##*/}
	tmux new -s $dir -d
	tmux send-keys -t $dir 'nv' C-m
	tmux attach -t $dir
}
