#! /bin/sh

if pgrep -x "ncspot" > /dev/null
then
    echo -n 'playpause' | nc -W1 -U ~/.cache/ncspot/ncspot.sock
elif pgrep -x "spotify" > /dev/null
then
  playerctl --player=spotify play-pause
fi
