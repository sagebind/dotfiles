# VSCode terminal integration features; only enable if running in a VSCode
# terminal
test "$TERM_PROGRAM" = "vscode"; and type -fq code
  or return

# Set VSCode as the default editor
set -gx EDITOR (type -fp code) -w
