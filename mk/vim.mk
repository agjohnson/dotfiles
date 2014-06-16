# Vim rules

BUILD ?= _build

VIM_SYNTAX := textile taskpaper
VIM_COLORS := ohess
VIM_AUTOLOAD := pathogen

VIM_BUNDLES = \
	https://github.com/Lokaltog/vim-powerline.git \
	https://github.com/tpope/vim-fugitive.git \
	https://github.com/klen/python-mode.git \
	https://github.com/airblade/vim-gitgutter.git \
	https://github.com/scrooloose/nerdtree.git \
	https://github.com/saltstack/salt-vim.git \
	https://github.com/scrooloose/syntastic.git \
	https://github.com/timcharper/textile.vim.git \
	https://github.com/groenewege/vim-less.git \
	https://github.com/motemen/xslate-vim.git \
	https://github.com/Townk/vim-autoclose.git \
	https://github.com/guns/vim-clojure-static.git


vim: vim-paths vim-files vim-bundles vim-bundle-powerline-patch

vim-paths:
	-[ -d $(BUILD)/.vim ] || mkdir -p $(BUILD)/.vim
	-[ -d $(BUILD)/.vim/syntax ] || mkdir -p $(BUILD)/.vim/syntax
	-[ -d $(BUILD)/.vim/colors ] || mkdir -p $(BUILD)/.vim/colors
	-[ -d $(BUILD)/.vim/autoload ] || mkdir -p $(BUILD)/.vim/autoload
	-[ -d $(BUILD)/.vim/bundle ] || mkdir -p $(BUILD)/.vim/bundle
	
vim-files: $(BUILD)/.vimrc \
	$(foreach vsyn,$(VIM_SYNTAX),$(BUILD)/.vim/syntax/$(vsyn).vim) \
	$(foreach vcol,$(VIM_COLORS),$(BUILD)/.vim/colors/$(vcol).vim) \
	$(foreach vauto,$(VIM_AUTOLOAD),$(BUILD)/.vim/autoload/$(vauto).vim)

$(BUILD)/.vimrc: vimrc
	cp $? $@

$(BUILD)/.vim/%.vim :: vim/%.vim
	cp $? $@

vim-bundles:
	for url in $(VIM_BUNDLES); do { \
		bundle=$$(echo $$url | sed -n 's/.*\/\([^\/]*\)\.git$$/\1/p'); \
		[ -d $(BUILD)/.vim/bundle/$$bundle ] || ( \
			cd $(BUILD)/.vim/bundle; \
			git clone $$url; \
		); \
	}; done;

vim-bundle-powerline-patch: $(BUILD)/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim

$(BUILD)/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim: vim/powerline-ohess.vim
	cp $? $@
