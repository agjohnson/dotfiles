
BOOTSTRAP=bootstrap

build: $(BOOTSTRAP)

clean:
	rm $(BOOTSTRAP)

$(BOOTSTRAP):
	head -n 4 bootstrap-template >> $@
	hg archive -t tgz -p .dotfiles - | base64 >> $@	
	tail -n +5 bootstrap-template >> $@

