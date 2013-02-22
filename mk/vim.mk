# Vim rules

VIM_SYNTAX := textile clojure taskpaper mkd
VIM_COLORS := ohess
VIM_AUTOLOAD := pathogen

VIM_BUNDLE_PL="https://github.com/Lokaltog/vim-powerline.git"
VIM_BUNDLE_FUG="https://github.com/tpope/vim-fugitive.git"


vim: vim-paths vim-files vim-bundle-powerline vim-bundle-fugitive \
     vim-bundle-powerline-patch

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

vim-bundle-powerline:
	-[ -d $(BUILD)/.vim/bundle/vim-powerline ] || (\
		cd $(BUILD)/.vim/bundle; \
		git clone $(VIM_BUNDLE_PL); \
	);

vim-bundle-fugitive:
	-[ -d $(BUILD)/.vim/bundle/vim-fugitive ] || (\
		cd $(BUILD)/.vim/bundle; \
		git clone $(VIM_BUNDLE_FUG); \
	);

vim-bundle-powerline-patch: $(BUILD)/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim

$(BUILD)/.vim/bundle/vim-powerline/autoload/Powerline/Colorschemes/ohess.vim: vim/powerline-ohess.vim
	cp $? $@
