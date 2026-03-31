OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"

.PHONY: apply
apply: link bootstrap

.PHONY: link
link: unfold-dirs
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
bootstrap: sudo
	ansible-playbook -v bootstrap.yml

.PHONY: bootstrap-dry-run
bootstrap-dry-run: sudo
	ansible-playbook -v --check --diff bootstrap.yml

# Prompt for sudo password, but only if needed, so that we don't have to type the
# password in repeatedly when running Ansible playbooks.
.PHONY: sudo
sudo:
ifeq ($(OS),linux)
	sudo -v
endif
