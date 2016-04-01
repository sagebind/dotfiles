# Dotfiles
This is my dotfiles repo, containing my configuration files for my Linux machines. There are many like
it, but this one is mine.

This repo exists so I can easily set up machines with my overly-tweaked settings for various applications
and terminal enhancements. Perhaps these may be helpful for you too. Feel free to copy any of these files
when tweaking your own system.

## Using it
Configuration is managed using a simple Fish shell script which manages installation
and symbolic links in a sane and portable way. To use these dotfiles, simply clone this repo and run the
`./install` script in the project folder to install the dotfiles. To see how its done, check
out the [`install.conf`](install.conf) file to see what symlinks are made.

## My setup
I use the amazingly powerful [Fish Shell](http://fishshell.com) as my default command line shell, so most
of the configuration is related to Fish. Here are some features of my terminal provided by these
dotfiles:

- Integration with the [Oh My Fish!](http://github.com/bpinto/oh-my-fish) framework for loading plugins.
- Enhanced prompt from Oh My Fish! themes.
- Every terminal window is also a [tmux](http://tmux.sourceorge.net) window and supports multiple panes.
  All terminal windows belong to the same session and you can easily switch between tmux windows from
  within any terminal.

Modified configuration is also provided some programs. Here are a few:

- [Atom](http://atom.io)
- [Git](http://git-scm.org)
- [tmux](http://tmux.github.io)
- [Redshift](http://jonls.dk/redshift/)

## License
All files unless otherwise bundled with a separate license is released under the MIT license. See
[LICENSE](LICENSE) for details.
