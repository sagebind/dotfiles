# Dotfiles #
Dotfiles for my personal UNIX-based machines. This repo exists so I can easily set up machines with my
overly-tweaked settings. Perhaps these may be helpful for you too. Feel free to use any of these files
when tweaking your own system.

Dotfiles are managed using [GNU Stow](http://www.gnu.org/software/stow/), a free, open-source and easily
installable symlink farm manager. Related dotfiles and config files are grouped into folders, with each
folder containing the relative path of the destination of the file. Files will be symlinked into each
path relative to your home directory.
