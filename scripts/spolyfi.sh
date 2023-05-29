#! /bin/sh

scroll_pos=0

while true; do
  if pgrep -x "ncspot" > /dev/null
  then
    playback=$(nc -W 1 -U ~/.cache/ncspot/ncspot.sock | jq -r 'if .mode.Playing then "playing" else "paused" end')
    track=$(nc -W 1 -U ~/.cache/ncspot/ncspot.sock | jq -r '.playable.title')
    artist=$(nc -W 1 -U ~/.cache/ncspot/ncspot.sock | jq -r '.playable.artists[0]')
    scroll_text="$track - $artist..."
  elif pgrep -x "spotify" > /dev/null
  then
    playback=$(playerctl --player=spotify status)
    track=$(playerctl --player=spotify metadata xesam:title)
    artist=$(playerctl --player=spotify metadata xesam:artist)
    scroll_text="$track - $artist..."
  else
    scroll_text="Spotify not running.."
    scroll_pos=$(( (scroll_pos + 1) % ${#scroll_text} ))
  fi

  if [ "$playback" = "Playing" ] || [ "$playback" = "playing" ]; then
    scroll_pos=$(( (scroll_pos + 1) % ${#scroll_text} ))
  fi

  echo "${scroll_text:$scroll_pos:${#scroll_text}}${scroll_text:0:$scroll_pos}"

  sleep 0.5
done
