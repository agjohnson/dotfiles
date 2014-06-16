# Weechat rules

BUILD ?= _build

WEECHAT_SRC = $(wildcard weechat/*)
WEECHAT_BUILD = $(patsubst weechat/%,$(BUILD)/.weechat/%,$(WEECHAT_SRC))


.PHONY: weechat

weechat: $(WEECHAT_BUILD)

$(BUILD)/.weechat/%: weechat/%
	[ -d $(BUILD)/.weechat ] || mkdir $(BUILD)/.weechat
	cp $? $@
