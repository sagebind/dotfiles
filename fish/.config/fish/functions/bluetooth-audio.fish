function bluetooth-audio --description "Enables bluetooth audio in Ubuntu"
    pactl load-module module-bluetooth-discover
end
