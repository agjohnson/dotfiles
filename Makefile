# Dotfiles Make

MERCURIAL_STYLES := dlog nlog sglog slog

SERVER_FILES := cshrc tmux.conf gitconfig
DESKTOP_FILES := conkyrc Xdefaults vimperatorrc

GTK_ICONS_URL := "http://faenza-icon-theme.googlecode.com/files/faenza-icon-theme_1.1.tar.gz"

BUILD := _build


.PHONY: build build-desktop install vim mutt xmonad \
	gtk misc-server misc-desktop mercurial mercurial-paths \
	mercurial-files termite

build: vim mercurial misc-server

build-desktop: build mutt xmonad termite weechat misc-desktop

clean:
	rm -rf $(BUILD)

install:
ifdef DEBUG
	diff -urd -x .git -x bundle $(BUILD)/ ~/ | grep -v '^Only in'
else
	rsync -crai $(BUILD)/ ~/
endif

# Mercurial

mercurial: mercurial-paths mercurial-files

mercurial-paths:
	-[ -d $(BUILD)/.hg ] || mkdir $(BUILD)/.hg

mercurial-files: \
	$(foreach mstyle,$(MERCURIAL_STYLES),$(BUILD)/.hg/$(mstyle).style)

$(BUILD)/.hg/%.style :: hg/%.style
	cp $? $@


# Mutt rules

mutt: mutt-paths mutt-files

mutt-paths:
	-[ -d $(BUILD)/.mutt ] || mkdir $(BUILD)/.mutt

mutt-files: $(BUILD)/.muttrc $(BUILD)/.mutt/account.muttrc $(BUILD)/.mutt/aliases.muttrc

$(BUILD)/.muttrc: muttrc
	cp $? $@

$(BUILD)/.mutt/%.muttrc: mutt/%.muttrc
	-[ -e $@ ] || cp $? $@

# Xmonad

xmonad: $(BUILD)/.xmonad/xmonad.hs $(BUILD)/.xmobarrc $(BUILD)/.xinitrc \
	$(BUILD)/bin/startup-functions.sh

$(BUILD)/.xmonad/xmonad.hs: xmonad/xmonad.hs
	-[ -d $(BUILD)/.xmonad ] || mkdir $(BUILD)/.xmonad
	cp $? $@

$(BUILD)/.xmobarrc: xmobarrc
	cp $? $@

$(BUILD)/.xinitrc: xinitrc
	cp $? $@

# Misc

server_files_base := $(foreach file,$(SERVER_FILES),$(BUILD)/.$(file))
desktop_files_base := $(foreach file,$(DESKTOP_FILES),$(BUILD)/.$(file))

misc-server: $(server_files_base)
misc-desktop: $(desktop_files_base)

$(BUILD)/.% :: %
	cp $? $@

include mk/tools.mk
include mk/gtk.mk
include mk/vim.mk
include mk/termite.mk
include mk/weechat.mk
include mk/redshift.mk
