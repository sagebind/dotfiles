OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"
HAS_DCONF := $(shell which dconf)
DCONF_FILES := $(wildcard dconf/*.ini)

.PHONY: apply
apply: link $(if $(HAS_DCONF),dconf)

.PHONY: link
link:
	stow --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: relink
relink:
	stow --restow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: dry-run
dry-run:
	stow --simulate --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: unlink
unlink:
	stow --delete --dir="$(CURDIR)" $(PACKAGES)

.PHONY: dconf
dconf: $(DCONF_FILES)

.PHONY: $(DCONF_FILES)
$(DCONF_FILES):
	dconf load $(subst .,/,$(subst dconf,,$(subst .ini,/,$@))) < $@
