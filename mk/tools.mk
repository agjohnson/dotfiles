# Makefile - tools

CPAN_URL="https://raw.github.com/miyagawa/cpanminus/master/cpanm"
GIT_MELD_URL="https://raw.github.com/wmanley/git-meld/master/git-meld.pl"

LOCALENV=~/.env
CPANM=$(LOCALENV)/bin/cpanm

install-tools: ~/.env/bin/ack ~/.env/bin/carton ~/.env/bin/rbenv ~/.env/bin/git-meld.pl ~/bin/startup-functions.sh

# Perl tools
$(LOCALENV)/bin/ack: $(CPANM) $(LOCALENV)/bin/localenv
	$(CPANM) -l $(LOCALENV) App::Ack

$(LOCALENV)/bin/carton: $(CPANM) $(LOCALENV)/bin/localenv
	$(CPANM) -l $(LOCALENV) Carton

$(LOCALENV)/bin/localenv: $(CPANM)
	$(CPANM) -l $(LOCALENV) App::local::lib::helper

$(LOCALENV)/bin/cpanm:
	-mkdir -p ~/.env/bin
	curl -Lko $(CPANM) "$(CPAN_URL)"
	chmod +x $(CPANM)
	$(CPANM) -L $(LOCALENV) App::cpanminus

$(LOCALENV)/bin/git-meld.pl:
	curl -Lko $@ "$(GIT_MELD_URL)"
	chmod +x $@

# Ruby stuff
$(LOCALENV)/bin/rbenv:
	cd ~/.env && \
		curl -Lko - 'https://github.com/sstephenson/rbenv/tarball/master' | \
			pax -z -r -v -s '/^[^\/]*\///'
	rm ~/.env/bin/rbenv
	ln -s ~/.env/libexec/rbenv ~/.env/bin/
	mkdir -p ~/.env/plugins/install
	cd ~/.env/plugins/install && \
		curl -Lko - 'https://github.com/sstephenson/ruby-build/tarball/master' | \
			pax -z -r -v -s '/^[^\/]*\///'

# Scripts
$(BUILD)/bin/startup-functions.sh: bin/startup-functions.sh
	[ -d $(BUILD)/bin ] || mkdir $(BUILD)/bin
	cp $? $@
