# Dotfiles
This is my dotfiles repo, containing my configuration files for my Linux machines. There are many like
it, but this one is mine.

This repo exists so I can easily set up machines with my overly-tweaked settings for various applications
and terminal enhancements. Perhaps these may be helpful for you too. Feel free to copy any of these files
when tweaking your own system.

## Using it
Configuration is managed using [Dotbot](http://github.com/anishathalye/dotbot) which manages installation
and symbolic links in a sane and portable way. To use these dotfiles, simply clone this repo and run the
`./install` script in the project folder to install the dotfiles using Dotbot. To see how its done, check
out the [`install.conf.json`](install.conf.json) file to see what symlinks are made.

## My setup
I use the amazingly powerful [Fish Shell](http://fishshell.com) as my default command line shell, so most
of the configuration is related to Fish. Here are some features of my terminal provided by these
dotfiles:

- Integration with the [Oh My Fish!](http://github.com/bpinto/oh-my-fish) framework for loading plugins.
- Enhanced prompt from Oh My Fish! themes.
- Every terminal window is also a [tmux](http://tmux.sourceorge.net) window and supports multiple panes.
  All terminal windows belong to the same session and you can easily switch between tmux windows from
  within any terminal.
- Integration with [autojump](http://github.com/joelthelion/autojump), the learning cd command.

Provided are also a few commands that I have written for my convenience, implemented as fish functions.
Here are a few of them:

- `apt`: A convenience wrapper around `apt-get` and friends to turn convoluted install commands into
  memorizable one-liners. For example, to view the details of a package, simply use `apt <package>`.
- `en`: A tiny wrapper around [Geeknote](http://www.geeknote.me/) that adds some extra functionality,
  such as pretty-printing Evernote notes inside the console.
- `composer-install`: A short script for installing [Composer](http://getcomposer.org) system-wide.

Modified configuration is also provided for the following programs:

- [Sublime Text](http://www.sublimetext.com)
- [Redshift](http://jonls.dk/redshift/)

## License
All files unless otherwise bundled with a separate license is released under the MIT license. See
[LICENSE](LICENSE) for details.

