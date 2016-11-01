function bluetooth-headset -d 'Connect a bluetooth audio headset'
  pulseaudio -k

  for i in (seq 5)
    echo "$i out of 5 tries..."
    echo "Go ahead and turn on the headset. Press any key after it is connected. "
    read -p '' -n 1
    sleep 1

    set -l card_number (pactl list cards short | grep 'bluez_card' | tail -n 1 | awk '{print $1}')

    if test -z "$card_number"
      echo "Headset profile not connected."
      echo "Trying to reconnect..."
      sudo service bluetooth restart
      continue
    end

    if pactl set-card-profile $card_number a2dp_sink
      echo "Headset connected successfully!"
      return
    end

    echo "Failed to set headset profile to A2DP."
    echo "Retrying..."
    sudo service bluetooth restart
  end
end
