OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"
HAS_DCONF := $(shell which dconf)
HAS_BREW := $(shell which brew)
DCONF_FILES := $(wildcard dconf/*.ini)
UNFOLDED_DIR_MARKERS := $(shell find $(PACKAGES) -type f -name .no-stow-folding)
UNFOLDED_DIRS := $(patsubst home.$(OS)/%, $(HOME)/%, $(patsubst home/%, $(HOME)/%, $(dir $(UNFOLDED_DIR_MARKERS))))

.PHONY: apply
apply: $(if $(HAS_BREW),brew-bundle) link $(if $(HAS_DCONF),dconf)

.PHONY: link
link: $(UNFOLDED_DIRS)
	stow --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: relink
relink: $(UNFOLDED_DIRS)
	stow --restow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: dry-run
dry-run:
	stow --simulate --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: unlink
unlink:
	stow --delete --dir="$(CURDIR)" $(PACKAGES)

$(UNFOLDED_DIRS):
	mkdir -p "$@"

.PHONY: dconf
dconf: $(DCONF_FILES)

.PHONY: $(DCONF_FILES)
$(DCONF_FILES):
	dconf load $(subst .,/,$(subst dconf,,$(subst .ini,/,$@))) < $@

.PHONY: brew-bundle
brew-bundle:
	brew bundle --file=pkg/Brewfile
