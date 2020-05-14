OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.FORCE: install
install: link install-vscode-extensions

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
	@code --list-extensions | sort -f | diff --new-line-format= --unchanged-line-format= vscode-extensions.txt - | xargs -L1 echo code --install-extension

.FORCE: update-vscode-extensions
update-vscode-extensions:
	@code --list-extensions | tee vscode-extensions.txt
