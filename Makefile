OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"
HAS_DCONF := $(shell which dconf 2>/dev/null)
HAS_DNF := $(shell which dnf 2>/dev/null)
HAS_FLATPAK := $(shell which flatpak 2>/dev/null)
HAS_BREW := $(shell which brew 2>/dev/null)
DCONF_FILES := $(wildcard dconf/*.ini)
UNFOLDED_DIR_MARKERS := $(shell find $(PACKAGES) -type f -name .no-stow-folding)
UNFOLDED_DIRS := $(patsubst home.$(OS)/%, $(HOME)/%, $(patsubst home/%, $(HOME)/%, $(dir $(UNFOLDED_DIR_MARKERS))))

.PHONY: apply
apply: $(if $(HAS_DNF),rpm-fedora) $(if $(HAS_FLATPAK),flatpak) $(if $(HAS_BREW),brew-bundle) link $(if $(HAS_DCONF),dconf)

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

.PHONY: bootstrap
bootstrap:
	ansible-playbook -K bootstrap.yml

.PHONY: dconf
dconf: $(DCONF_FILES)

.PHONY: $(DCONF_FILES)
$(DCONF_FILES):
	dconf load $(subst .,/,$(subst dconf,,$(subst .ini,/,$@))) < $@

.PHONY: brew-bundle
brew-bundle:
	brew bundle --file=pkg/Brewfile

RPM_PACKAGES = $(shell cat pkg/rpm/fedora)
RPM_PACKAGES_NOT_INSTALLED = $(shell rpm -q $(RPM_PACKAGES) | sed -n 's/^package \(\S\+\) is not installed$$/\1/p')
.PHONY: rpm-fedora
rpm-fedora:
ifeq ($(RPM_PACKAGES_NOT_INSTALLED),)
else
	@echo "Installing missing RPM packages. Will ask for sudo privileges."
	sudo dnf install $(RPM_PACKAGES_NOT_INSTALLED)
endif

FLATPAK_PACKAGES = $(shell cat pkg/flatpak)
FLATPAK_PACKAGES_NOT_INSTALLED = $(shell flatpak list --columns=application | grep -f - -v pkg/flatpak)
.PHONY: flatpak
flatpak:
ifeq ($(FLATPAK_PACKAGES_NOT_INSTALLED),)
else
	@echo "Installing missing Flatpak packages."
	flatpak install --user $(FLATPAK_PACKAGES_NOT_INSTALLED)
endif
