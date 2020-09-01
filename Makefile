OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.PHONY: install
install: link install-vscode-extensions

.PHONY: uninstall
uninstall: unlink

.PHONY: link
link:
	stow --stow --override=".*" -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)

.PHONY: unlink
unlink:
	stow --delete -vv -d "$(PWD)" -t "$(HOME)" $(PACKAGES)

.PHONY: wsl
wsl:
	ln -f -s "home.windows/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/SwitchBetweenWindows.ahk" "/mnt/c/Users/Stephen/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/SwitchBetweenWindows.ahk"
	ln -f -s "home.windows/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/wsl.xlaunch" "/mnt/c/Users/Stephen/AppData/Roaming/Microsoft/Windows/Start Menu/Programs/Startup/wsl.xlaunch"
