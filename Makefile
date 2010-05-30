
.PHONY: csh vim tmux

build: csh

csh:
	cp cshrc ~/.cshrc

vim: 
	cp vimrc ~/.vimrc
	-mkdir -p ~/.vim/colors
	cp vim/colors/* ~/.vim/colors/

tmux:
	cp tmux.conf ~/.tmux.conf

