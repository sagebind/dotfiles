# Add common local bin directories to the PATH if they are present.

set -l paths \
  # GNU POSIX utilities on macOS
  /opt/homebrew/opt/coreutils/libexec/gnubin \
  /opt/homebrew/opt/gnu-sed/libexec/gnubin \
  # Homebrew
  /opt/homebrew/bin \
  /home/linuxbrew/.linuxbrew/bin \
  # Rust tools
  $HOME/.cargo/bin \
  # kubectl plugins
  $HOME/.krew/bin \
  # Local bin, usually already in path
  $HOME/.local/bin

for p in $paths
  test -d $p
    and fish_add_path --global $p
end
