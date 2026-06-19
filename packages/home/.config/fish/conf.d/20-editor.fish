# Select the default editor based on fallback order:
#
# - If we're in a graphical environment, use Zed or VSCode if available.
# - Otherwise, use Microsoft Edit if available.
# - As a last resort, use Nano.

if set -q DISPLAY; or not string match -i linux (uname)
  for editor in zed code
    if type -fq $editor
      set -gx EDITOR (type -fp $editor) -w
      return
    end
  end
end

for editor in msedit edit nano
  if type -fq $editor
    set -gx EDITOR (type -fp $editor)
    return
  end
end
