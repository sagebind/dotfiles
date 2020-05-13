OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.FORCE: install
install: link

.FORCE: uninstall
uninstall: unlink

.FORCE: link
link:
	stow --stow --override=".*" -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)

.FORCE: unlink
unlink:
	stow --delete -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)

.FORCE: install-vscode-extensions
install-vscode-extensions:
	@while read in; do code --install-extension "$$in"; done < vscode-extensions.txt

.FORCE: update-vscode-extensions
update-vscode-extensions:
	@code --list-extensions > vscode-extensions.txt
