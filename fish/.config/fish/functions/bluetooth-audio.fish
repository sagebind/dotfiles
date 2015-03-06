function bluetooth-audio -d "Enables bluetooth audio in Ubuntu"
    pactl load-module module-bluetooth-discover
end
