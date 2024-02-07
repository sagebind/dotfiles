# Add common local bin directories to the PATH if they are present.

set -l paths \
  # Local bin, usually already in path
  $HOME/.local/bin \
  # Rust tools
  $HOME/.cargo/bin \
  # kubectl plugins
  $HOME/.krew/bin \
  # Homebrew
  /opt/homebrew/bin \
  /home/linuxbrew/.linuxbrew/bin \
  # GNU POSIX utilities on macOS
  /opt/homebrew/opt/coreutils/libexec/gnubin \
  /opt/homebrew/opt/gnu-sed/libexec/gnubin

for p in $paths
  test -d $p
    and fish_add_path --global $p
end
