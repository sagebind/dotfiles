#!/usr/bin/env bash

HA_ENDPOINT=$(hctl config get hub.url | tail -n1 | awk '{print $2}')
HA_TOKEN=$(hctl config get hub.token | tail -n1 | awk '{print $2}')
MEDIA_PLAYER_ID=media_player.living_room_tv_aggregate

if [ "$1" == "play" ]; then
    curl \
        -s \
        -H "Authorization: Bearer $HA_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"entity_id\": \"$MEDIA_PLAYER_ID\"}" \
        $HA_ENDPOINT/services/media_player/media_play
    touch "${BASH_SOURCE[0]}"
    exit
fi

if [ "$1" == "pause" ]; then
    curl \
        -s \
        -H "Authorization: Bearer $HA_TOKEN" \
        -H "Content-Type: application/json" \
        -d "{\"entity_id\": \"$MEDIA_PLAYER_ID\"}" \
        $HA_ENDPOINT/services/media_player/media_pause
    touch "${BASH_SOURCE[0]}"
    exit
fi

{
    read MEDIA_PLAYER_STATE
    read MEDIA_TITLE
} <<< $(
    curl -s -H "Authorization: Bearer $HA_TOKEN" $HA_ENDPOINT/states/$MEDIA_PLAYER_ID \
        | jq -r '.state, .attributes.media_title // .attributes.source'
)

if [ "$MEDIA_PLAYER_STATE" == "playing" ]; then
    echo "<small>${MEDIA_TITLE/|/｜}</small> | iconName=media-playback-start-symbolic"
    echo "---"
    echo "Pause | iconName=media-playback-pause-symbolic bash='${BASH_SOURCE[0]}' param1=pause terminal=false refresh=false"
elif [ "$MEDIA_PLAYER_STATE" == "paused" ]; then
    echo "<small>${MEDIA_TITLE/|/｜}</small> | iconName=media-playback-pause-symbolic"
    echo "---"
    echo "Play | iconName=media-playback-start-symbolic bash='${BASH_SOURCE[0]}' param1=play terminal=false refresh=false"
else
    echo "---"
fi
