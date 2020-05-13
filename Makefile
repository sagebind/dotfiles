OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.FORCE: install
install:
	stow --stow --override=".*" -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)

.FORCE: uninstall
uninstall:
	stow --delete -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)
