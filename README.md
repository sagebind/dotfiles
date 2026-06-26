# Dotfiles

This is my dotfiles repo, which contains configuration files for my personal computers. There are many like it, but this one is mine. This repo exists so I can easily set up machines with my personalized configuration for various applications and terminal enhancements.

## Using it

Everything is managed using [mise](https://mise.jdx.dev), which provides dependencies used to setup dotfiles as well as globally available tools. First requirement is to install mise on your machine in whatever way works.

Once mise is installed, clone this repo and run `mise bootstrap` in the repo root to install the dotfiles. This can be as simple as:

```sh
git clone https://github.com/sagebind/dotfiles ~/.dotfiles
cd ~/.dotfiles
mise bootstrap
```

The `bootstrap` command will configure any desired system packages that should be installed, set up symlinks for all dotfiles, and also run any extra scripts to configure the machine. This includes both home-level changes _and_ system-wide changes (which will use `sudo` to apply). This is very opinionated, so make sure you really want all the configuration! If you _only_ want to set up the dotfiles symlinks, run `mise dotfiles apply` instead.

Whenever changes are made to the dotfiles repo, you can run `mise bootstrap` again to apply the changes.

## History

My [first commit](/../../commit/656476c8d404b0a9161a1733c6ecdc76e45f5c0b) to this repository was on December 31st, 2014. That was not too long after I had started using Ubuntu as my primary operating system on my daily driver laptop, having been exclusively a Windows user up to that point. Having already discovered the delight of most of my environment being controllable by simple config files, I then ran across a casual online comment about using Git to manage those files, and then created this repository for myself.

The ability to use Git to revert to prior versions of configuration proved to be very useful, especially when you're a college student excited about learning how to reconfigure (and break) Linux, and doing so on your only laptop that you also need working to do class work with!

For a very long time, these dotfiles were managed with [GNU Stow](https://www.gnu.org/software/stow/), which I liked because it kept things very simple to understand and maintain. I also prefer the symlink approach since config file modifications made in other programs are clearly visible as dirty in the Git reposiory.

As of 2026, I have experimented with alternatives in order to address the need to pre-install software and make common system modifications. I have moved toward adopting mise in more projects since I like its simplicity and speed. Its not a perfect dotfiles manager, but it does the job.

## License

All files unless otherwise bundled with a separate license are available under the MIT license. See the [LICENSE](LICENSE) file for details.
