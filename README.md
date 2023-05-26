# Dotfiles

This is my dotfiles repo, which contains configuration files for my personal computers. There are many like it, but this one is mine. This repo exists so I can easily set up machines with my personalized configuration for various applications and terminal enhancements.

## Using it

Configuration is managed using a simple [Makefile] which wraps around [GNU Stow]. To use these dotfiles, simply clone this repo and run `make` script in the project folder to install the dotfiles. Files that apply to all systems are in `home` while platform-specific configuration is in `home.$OS`.

The Makefile also provides a few other useful targets as well to automate other tasks related to dotfiles and machine setup.

## License

All files unless otherwise bundled with a separate license are available under the MIT license. See the [LICENSE] file for details.


[Fish Shell]: https://fishshell.com
[GNU Stow]: https://www.gnu.org/software/stow/
[LICENSE]: LICENSE
[Makefile]: https://www.gnu.org/software/make/
