# Dotfiles

This is my dotfiles repo, which contains configuration files for my personal computers. There are many like it, but this one is mine. This repo exists so I can easily set up machines with my personalized configuration for various applications and terminal enhancements.

## Using it

Everything is managed using [mise](https://mise.jdx.dev), which provides dependencies used to setup dotfiles as well as globally available tools. First requirement is to install mise on your machine in whatever way works.

Once mise is installed, clone this repo and run `mise run apply` in the repo root to install the dotfiles, which wraps [GNU Stow](https://www.gnu.org/software/stow/). Most of the top-level directories in this repo are Stow [_packages_](https://www.gnu.org/software/stow/manual/html_node/Installing-Packages.html). These packages are modular and can be optionally installed for different machines. Files that apply to all systems are in the `home` package while platform-specific configuration is in a `home.$OS` package. The install script will automatically select the appropriate packages that should be installed.

This can be as simple as:

```sh
git clone https://github.com/sagebind/dotfiles ~/.dotfiles
cd ~/.dotfiles
mise run apply
```

## History

My [first commit](/../../commit/656476c8d404b0a9161a1733c6ecdc76e45f5c0b) to this repository was on December 31st, 2014. That was not too long after I had started using Ubuntu as my primary operating system on my daily driver laptop, having been exclusively a Windows user up to that point. Having already discovered the delight of most of my environment being controllable by simple config files, I then ran across a casual online comment about using Git to manage those files, and then created this repository for myself.

The ability to use Git to revert to prior versions of configuration proved to be very useful, especially when you're a college student excited about learning how to reconfigure (and break) Linux, and doing so on your only laptop that you also need working to do class work with!

## License

All files unless otherwise bundled with a separate license are available under the MIT license. See the [LICENSE](LICENSE) file for details.
