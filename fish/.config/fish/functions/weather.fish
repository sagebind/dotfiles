function weather --description "Displays local weather info"
    command weather -q KJVL | awk '{if(NR>2)print}'
end
