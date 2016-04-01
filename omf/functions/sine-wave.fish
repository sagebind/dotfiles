function sine-wave
  set i 0
  while true
    set line (python -c "from math import *;print map( lambda x: ceil(6*sin((x+$i)*pi/5)), range($COLUMNS) )" | tr -d '[]' | spark | tr -d '\n')
    echo -ne "$line\r"
    set i (math "$i+1")
    sleep 0.05
  end
  echo
end
