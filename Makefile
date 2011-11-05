# Dotfiles Make

VIM_SYNTAX := textile clojure taskpaper mkd
VIM_COLORS := ohess

SERVER_FILES := cshrc tmux.conf
DESKTOP_FILES := conkyrc Xdefaults


.PHONY: install-server install-desktop install-all vim mutt xmonad \
	misc-server misc-desktop

install: install-server

install-server: vim misc-server

install-desktop: install-server mutt xmonad misc-desktop


# Vim rules

vim: vim-paths vim-files

vim-paths:
	-[ -d ~/.vim ] || mkdir ~/.vim
	-[ -d ~/.vim/syntax ] || mkdir ~/.vim/syntax
	-[ -d ~/.vim/colors ] || mkdir ~/.vim/colors
	
vim-files: ~/.vimrc \
	$(foreach vsyn,$(VIM_SYNTAX),~/.vim/syntax/$(vsyn).vim) \
	$(foreach vcol,$(VIM_COLORS),~/.vim/colors/$(vcol).vim)

~/.vimrc: vimrc
	cp $? $@

~/.vim/%.vim :: vim/%.vim
	cp $? $@


# Mutt rules

mutt: mutt-paths mutt-files

mutt-paths:
	-[ -d ~/.mutt ] || mkdir ~/.mutt

mutt-files: ~/.muttrc ~/.mutt/account.muttrc ~/.mutt/aliases.muttrc

~/.muttrc: muttrc
	cp $? $@

~/.mutt/%.muttrc: mutt/%.muttrc
	-[ -e $@ ] || cp $? $@

# Xmonad

xmonad: ~/.xmonad/xmonad.hs ~/.xmobarrc ~/.xinitrc

~/.xmonad/xmonad.hs: xmonad/xmonad.hs
	-[ -d ~/.xmonad ] || mkdir ~/.xmonad
	cp $? $@

~/.xmobarrc: xmobarrc
	cp $? $@

~/.xinitrc: xinitrc
	cp $? $@

# Misc

server_files_base := $(foreach file,$(SERVER_FILES),~/.$(file))
desktop_files_base := $(foreach file,$(DESKTOP_FILES),~/.$(file))

misc-server: $(server_files_base)
misc-desktop: $(desktop_files_base)

~/.% :: %
	cp $? $@

