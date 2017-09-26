# GTK themes

BUILD?=_build

GTKv1_CONF=./gtk/gtkrc
GTKv2_CONF=./gtk/gtkrc-2.0
GTKv3_CONF=$(wildcard ./gtk/gtk-3.0/*)

GTK_CONFS=$(GTKv1_CONF) $(GTKv2_CONF) $(GTKv3_CONF)
GTK_CONFS_BUILD=\
	$(patsubst ./gtk/%,$(BUILD)/.%,$(GTKv1_CONF)) \
	$(patsubst ./gtk/%,$(BUILD)/.%,$(GTKv2_CONF)) \
	$(patsubst ./gtk/gtk-3.0/%,$(BUILD)/.config/gtk-3.0/%,$(GTKv3_CONF))

.PHONY: gtkrc

gtk: $(GTK_CONFS_BUILD)

$(BUILD)/.config/gtk-3.0/%: ./gtk/gtk-3.0/%
	[ -d $(BUILD)/.config/gtk-3.0 ] || mkdir -p $(BUILD)/.config/gtk-3.0
	cp $? $@

$(BUILD)/.gtkrc: ./gtk/gtkrc
	cp $? $@

$(BUILD)/.gtkrc-2.0: ./gtk/gtkrc-2.0
	cp $? $@
