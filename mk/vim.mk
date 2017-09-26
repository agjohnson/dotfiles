# Vim rules

BUILD ?= _build

VIM_PATH := .config/nvim
VIM_SYNTAX := textile taskpaper
VIM_COLORS := ohess
VIM_AUTOLOAD := pathogen

VIM_BUNDLES = \
	https://github.com/mileszs/ack.vim.git \
	https://github.com/kien/ctrlp.vim.git \
	https://github.com/scrooloose/nerdtree.git \
	https://github.com/klen/python-mode.git \
	https://github.com/saltstack/salt-vim.git \
	https://github.com/scrooloose/syntastic.git \
	https://github.com/davidoc/taskpaper.vim \
	https://github.com/timcharper/textile.vim.git \
	https://github.com/Townk/vim-autoclose.git \
	https://github.com/guns/vim-clojure-static.git \
	https://github.com/isRuslan/vim-es6 \
	https://github.com/kana/vim-fakeclip.git \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/airblade/vim-gitgutter.git \
	https://github.com/hylang/vim-hy.git \
	https://github.com/pangloss/vim-javascript.git \
	https://github.com/ledger/vim-ledger.git \
	https://github.com/groenewege/vim-less.git \
	https://github.com/Lokaltog/vim-powerline.git


vim: vim-paths vim-files vim-bundles vim-bundle-powerline-patch

vim-paths:
	-[ -d $(BUILD)/$(VIM_PATH) ] || mkdir -p $(BUILD)/$(VIM_PATH)
	-[ -d $(BUILD)/$(VIM_PATH)/syntax ] || mkdir -p $(BUILD)/$(VIM_PATH)/syntax
	-[ -d $(BUILD)/$(VIM_PATH)/colors ] || mkdir -p $(BUILD)/$(VIM_PATH)/colors
	-[ -d $(BUILD)/$(VIM_PATH)/autoload ] || mkdir -p $(BUILD)/$(VIM_PATH)/autoload
	-[ -d $(BUILD)/$(VIM_PATH)/bundle ] || mkdir -p $(BUILD)/$(VIM_PATH)/bundle
	
vim-files: $(BUILD)/$(VIM_PATH)/init.vim \
	$(foreach vsyn,$(VIM_SYNTAX),$(BUILD)/$(VIM_PATH)/syntax/$(vsyn).vim) \
	$(foreach vcol,$(VIM_COLORS),$(BUILD)/$(VIM_PATH)/colors/$(vcol).vim) \
	$(foreach vauto,$(VIM_AUTOLOAD),$(BUILD)/$(VIM_PATH)/autoload/$(vauto).vim)

$(BUILD)/$(VIM_PATH)/init.vim: init.vim
	cp $? $@

$(BUILD)/$(VIM_PATH)/%.vim :: vim/%.vim
	cp $? $@

vim-bundles:
	for url in $(VIM_BUNDLES); do { \
		bundle=$$(echo $$url | sed -n 's/.*\/\([^\/]*\)\.git$$/\1/p'); \
		[ -d $(BUILD)/$(VIM_PATH)/bundle/$$bundle ] || ( \
			cd $(BUILD)/$(VIM_PATH)/bundle; \
			git clone $$url; \
		); \
	}; done;

vim-bundle-powerline-patch: $(BUILD)/$(VIM_PATH)/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim

$(BUILD)/$(VIM_PATH)/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim: vim/powerline-ohess.vim
	cp $? $@
