# Load autojump
source /usr/share/autojump/autojump.fish

# Hide greeting
function fish_greeting
end

# Better titles
function fish_title
  test (count $argv) -gt 0
    and echo $argv[1]
    or echo $_
end
