# Dotfiles

This is my dotfiles repo, which contains configuration files for my personal computers. There are many like it, but this one is mine. This repo exists so I can easily set up machines with my personalized configuration for various applications and terminal enhancements.

## Using it

Configuration is managed using a simple [Makefile] which wraps around [GNU Stow]. To use these dotfiles, simply clone this repo and run `make` script in the project folder to install the dotfiles. Files that apply to all systems are in `home` while platform-specific configuration is in `home.$OS`.

The Makefile also provides a few other useful targets as well to automate other tasks related to dotfiles and machine setup.

## History

My [first commit](/../../commit/656476c8d404b0a9161a1733c6ecdc76e45f5c0b) to this repository was on December 31st, 2014. That was not too long after I had started using Ubuntu as my primary operating system on my daily driver laptop, having been exclusively a Windows user up to that point. Having already discovered the delight of most of my environment being controllable by simple config files, I then ran across a casual online comment about using Git to manage those files, and then created this repository for myself.

The ability to use Git to revert to prior versions of configuration proved to be very useful, especially when you're a college student excited about learning how to reconfigure (and break) Linux, and doing so on your only laptop that you also need working to do class work with!

## License

All files unless otherwise bundled with a separate license are available under the MIT license. See the [LICENSE] file for details.


[Fish Shell]: https://fishshell.com
[GNU Stow]: https://www.gnu.org/software/stow/
[LICENSE]: LICENSE
[Makefile]: https://www.gnu.org/software/make/
