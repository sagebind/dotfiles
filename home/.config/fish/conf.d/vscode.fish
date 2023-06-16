# VSCode terminal integration features; only enable if running in a VSCode
# terminal
test "$TERM_PROGRAM" = "vscode"; and type -fq code
  or return

# Enable shell integration
if command code --locate-shell-integration-path fish | read -l file
  source $file
end

# Set VSCode as the default editor
set -gx EDITOR (which code) -w
