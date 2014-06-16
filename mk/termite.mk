# Termite rules

BUILD?=_build

TERMITE_CONFIGS=$(wildcard ./termite/*)
TERMITE_CONFIGS_BUILD=$(patsubst ./termite/%,$(BUILD)/.config/termite/%,$(TERMITE_CONFIGS))

.PHONY: termite

termite: $(TERMITE_CONFIGS_BUILD)

$(BUILD)/.config/termite/%: ./termite/%
	[ -d $(BUILD)/.config/termite ] || mkdir -p $(BUILD)/.config/termite
	cp $? $@
