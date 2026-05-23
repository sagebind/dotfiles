OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.PHONY: apply
apply: link bootstrap

.PHONY: link
link: unfold-dirs
	sh -c 'chmod +x home.linux/.local/bin/*'
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

.PHONY: unfold-dirs
unfold-dirs:
	find $(PACKAGES) -type f -name .no-stow-folding -exec sh -c 'mkdir -pv ~/$$(dirname "$$1" | cut -d/ -f2-)' sh '{}' ';'

.PHONY: bootstrap
bootstrap:
	ansible-playbook -v --ask-become-pass bootstrap.yml

.PHONY: bootstrap-dry-run
bootstrap-dry-run:
	ansible-playbook -v --ask-become-pass --check --diff bootstrap.yml

.PHONY: ansible-facts
ansible-facts:
	ansible localhost -m ansible.builtin.setup

.PHONY: flox-upgrade-commit
flox-upgrade-commit:
	flox upgrade
	git commit -m "flox upgrade" -- "$(CURDIR)/home/.flox"

.PHONY: new-machine
new-machine: $(HOME)/.ssh/id_ed25519
	gh auth login --hostname github.com --git-protocol ssh --web --skip-ssh-key
	gh ssh-key add "$<".pub --type authentication --title $(shell hostname)
	git remote set-url origin git@github.com:sagebind/dotfiles.git

$(HOME)/.ssh/id_ed25519:
	ssh-keygen -f "$@" -t ed25519 -C "me@stephencoakley.com"
