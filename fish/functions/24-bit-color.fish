# This script is based off of a script taken from iterm2 https://github.com/gnachman/iTerm2/blob/master/tests/24-bit-color.sh
#
#   This script echoes a bunch of 24-bit color codes
#   to the terminal to demonstrate its functionality.
#   The foreground escape sequence is ^[38;2;<r>;<g>;<b>m
#   The background escape sequence is ^[48;2;<r>;<g>;<b>m
#   <r> <g> <b> range from 0 to 255 inclusive.
#   The escape sequence ^[0m returns output to default
function 24-bit-color
  function __set_color
    printf '\x1b[48;2;%.0f;%.0f;%.0fm' $argv
  end

  function __reset_color
    printf '\x1b[0m\n'
  end

  for i in (seq 0 127)
    __set_color $i 0 0
    echo -en " "
  end
  __reset_color
  for i in (seq 255 -1 128)
    __set_color $i 0 0
    echo -en " "
  end
  __reset_color

  for i in (seq 0 127)
    __set_color 0 $i 0
    echo -n " "
  end
  __reset_color
  for i in (seq 255 -1 128)
    __set_color 0 $i 0
    echo -n " "
  end
  __reset_color

  for i in (seq 0 127)
    __set_color 0 0 $i
    echo -n " "
  end
  __reset_color
  for i in (seq 255 -1 128)
    __set_color 0 0 $i
    echo -n " "
  end
  __reset_color

  set -l freq (math 'scale=4; 3.1415 / 128')
  for i in (seq 0 127)
    set -l rgb (echo "c($freq * $i) * 127 + 128; c($freq * $i + 2.094) * 127 + 128; c($freq * $i + 4.189) * 127 + 128" | bc -l)
    __set_color $rgb
    echo -n " "
  end
  __reset_color
  for i in (seq 255 -1 128)
    set -l rgb (echo "c($freq * $i) * 127 + 128; c($freq * $i + 2.094) * 127 + 128; c($freq * $i + 4.189) * 127 + 128" | bc -l)
    __set_color $rgb
    echo -n " "
  end
  __reset_color
end
