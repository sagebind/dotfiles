function bluetooth-headset -d 'Connect a bluetooth audio headset'
  pulseaudio -k

  # Set profile to A2DP
  while true
    echo -n "Waiting for headset to connect... "
    while not hcitool con | grep 'ACL' > /dev/null ^&2
      sleep 1
    end
    echo "Done"

    echo -n "Getting card address... "
    sleep 20
    set -l card_number (pactl list cards short | grep 'bluez_card' | tail -n 1 | awk '{print $2}')

    if test -z "$card_number"
      echo "Profile not connected"
    else
      echo $card_number

      echo -n "Setting card profile... "
      if pactl set-card-profile $card_number a2dp_sink
        echo "Done"
        break
      end
    end

    echo "Retrying..."
    sudo service bluetooth restart
  end

  # Set default sink
  set -l sink (pactl list sinks short | grep 'bluez_sink' | tail -n 1 | awk '{print $2}')
  pactl set-default-sink $sink
end
