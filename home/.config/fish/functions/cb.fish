# A short and memorable command that sort of acts like a pass-through pipe using
# the system clipboard.
#
# I used to maintain custom `pbcopy` and `pbpaste` functions as complexity of
# accessing the system clipboard increased across platforms, but nowadays Fish
# includes built-in functions for this that work just as well as my custom ones.

function cb -d 'Gets or sets the system clipboard content'
  # If we are likely not the start of a pipeline then read stdin into the
  # clipboard.
  if not isatty stdin
    fish_clipboard_copy 2> /dev/null
  end

  # Always echo the current value of the clipboard.
  fish_clipboard_paste | cat -
end
