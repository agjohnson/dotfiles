# Dotfiles Make

VIM_SYNTAX := textile clojure taskpaper
VIM_COLORS := ohess

SERVER_FILES := cshrc tmux.conf
DESKTOP_FILES := conkyrc Xdefaults


.PHONY: install-server install-desktop install-all vim xmonad \
	misc-server misc-desktop

install: install-server

install-server: vim misc-server

install-desktop: install-server xmonad misc-desktop


# Vim rules

vim: vim-paths vim-files

vim-paths:
	-mkdir -p ~/.vim/{syntax,colors}
	
vim-files: ~/.vimrc \
	$(foreach vsyn,$(VIM_SYNTAX),~/.vim/syntax/$(vsyn).vim) \
	$(foreach vcol,$(VIM_COLORS),~/.vim/colors/$(vcol).vim)

~/.vimrc: vimrc
	cp $? $@

~/.vim/%.vim :: vim/%.vim
	cp $? $@


# Xmonad

xmonad: ~/.xmonad/xmonad.hs ~/.xmobarrc

~/.xmonad/xmonad.hs: xmonad/xmonad.hs
	-mkdir ~/.xmonad
	cp $? $@

~/.xmobarrc: xmobarrc
	cp $? $@


# Misc

server_files_base := $(foreach file,$(SERVER_FILES),~/.$(file))
desktop_files_base := $(foreach file,$(DESKTOP_FILES),~/.$(file))

misc-server: $(server_files_base)
misc-desktop: $(desktop_files_base)

~/.% :: %
	cp $? $@

