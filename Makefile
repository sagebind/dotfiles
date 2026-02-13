OS := $(shell uname | tr '[:upper:]' '[:lower:]')
PACKAGES := home "home.$(OS)"
UNFOLDED_DIR_MARKERS := $(shell find $(PACKAGES) -type f -name .no-stow-folding)
UNFOLDED_DIRS := $(patsubst home.$(OS)/%, $(HOME)/%, $(patsubst home/%, $(HOME)/%, $(dir $(UNFOLDED_DIR_MARKERS))))

.PHONY: apply
apply: link bootstrap

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
