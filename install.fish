#!/usr/bin/env fish
# Bootstrap script for installing dotfiles.

# Set up configuration variables.
set REPO (realpath (dirname (status -f)))
set PATTERNS $argv


function log
  set -l s $status
  set_color green; echo $argv; set_color normal
  return $s
end

function error
  set -l s $status
  set_color red; echo $argv >&1; set_color normal
  set -g ERROR 1
  return $s
end

function match -a path
  if not set -q PATTERNS[1]
    return 0
  end

  for pattern in $PATTERNS
    if echo "$path" | grep -q "$pattern"
      return 0
    end
  end

  return 1
end

function clean -a dir
  test -e $dir
    or return 1

  # Find links in the target directory.
  for link in (find -P $dir -maxdepth 1 -type l ^ /dev/null)
    # Check if the link points to somewhere in the repo.
    set -l target (readlink $link ^ /dev/null)
    if echo $target | grep -q "^$REPO"
      # If the link is invalid, remove it.
      if not test -e $target
        rm $link
          and log "Removed invalid link: $link -> $target"
          or error "Failed to remove link: $link"
      end
    end
  end
end

function link -a dest src
  # If a pattern is given, skip this link.
  if not match "$dest"
    log "Does not match pattern: $dest"
    return 0
  end

  set src "$REPO/$src"
  set dir (dirname "$dest")

  if test $src = (readlink $dest ^ /dev/null; or echo)
    log "Link exists: $dest -> $src"
    return
  else if test -e $dest -o -L $dest
    rm $dest
      and log "Removed existing file: $dest"
      or error "Failed to remove file: $dest"
      or return 1
  end

  mkdir -p $dir
    or error "Failed to create directory: $dir"
    or return 1
  test -e $src
    or error "Link target missing: $src"
    or return 1
  ln -s $src $dest
    or error "Failed to create link: $dest"
    or return 1
  log "Created link: $dest -> $src"
end

# Define OS.
set -g os (uname | tr '[:upper:]' '[:lower:]')

# Execute configuration.
source $REPO/install.conf

# Report errors.
echo; set -q ERROR
  and error "Some actions failed."
  and exit $ERROR
  or log "All actions finished successfully."
  or exit 0
