# Redshift rules

BUILD?=_build

.PHONY: redshift

redshift: $(BUILD)/.config/redshift.conf

$(BUILD)/.config/redshift.conf: ./redshift.conf
	cp $? $@

