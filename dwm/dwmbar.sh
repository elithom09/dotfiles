#vol=$(amixer -c 0 -M -D pulse get Master | grep -o -E [[:digit:]]+% | tail -n +2)
vol=$(pactl get-sink-volume 0 | awk '$1=="Volume:" {print $5}')
bat=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | tail --bytes +26)

sid=$(iwgetid -r)
adr=$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')

while true; do
	xsetroot -name "$USER@$HOSTNAME [${sid} ${adr}] [battery: ${bat}] [volume: $(pactl get-sink-volume 0 | awk '$1=="Volume:" {print $5}')] [$(date)]"
	sleep 0.1
done
