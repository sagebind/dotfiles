function fix-bluetooth
    sudo alsa force-reload
    sudo killall pulseaudio
    pulseaudio --start
    sudo restart bluetooth
end
