# Makefile - tools

CPAN_URL="https://raw.github.com/miyagawa/cpanminus/master/cpanm"

LOCALENV=~/.env
CPANM=$(LOCALENV)/bin/cpanm

install-tools: ~/.env/bin/ack

$(LOCALENV)/bin/ack: $(CPANM) $(LOCALENV)/bin/localenv
	$(CPANM) -L $(LOCALENV) App::Ack

$(LOCALENV)/bin/localenv: $(CPANM)
	$(CPANM) -L $(LOCALENV) App::local::lib::helper

$(LOCALENV)/bin/cpanm:
	-mkdir -p ~/.env/bin
	curl -Lko $(CPANM) "$(CPAN_URL)"
	chmod +x $(CPANM)
	$(CPANM) -L $(LOCALENV) App::cpanminus


