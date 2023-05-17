OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.PHONY: link
link:
	stow --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: dry-run
dry-run:
	stow --simulate --stow --dir="$(CURDIR)" $(PACKAGES)

.PHONY: unlink
unlink:
	stow --delete --dir="$(CURDIR)" $(PACKAGES)
