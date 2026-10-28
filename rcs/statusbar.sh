#!/bin/sh

VOLUME=$(pactl get-sink-volume $(pactl get-default-sink) | awk '$1=="Volume:" {print $5}')

BATTERY=$(acpi | grep Battery\ 1 | awk '{print $4}' | head -c 3)
if acpi | grep " Charging"; then
	BATTERY="${BATTERY}"
fi

ADDRESS=$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')

TEMP=$(sensors | grep Tctl | tail -c 10 | head -c 7)

MEMUSED=$(free -h | grep Mem | awk '{print $3}')
MEMTOT=$(free -h | grep Mem | awk '{print $2}')

CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%

xsetroot -name "^c#99DD99^[IP: ${ADDRESS}] ^c#CC77CC^[BAT: ${BATTERY}] ^c#EE7777^[VOL: ${VOLUME}] ^c#7777EE^[MEM: ${MEMUSED}/${MEMTOT}] ^c#EEAAAA^[TEMP: ${TEMP}]  ^c#66BBEE^[$(date "+%a %b %d %Y %r")]"
