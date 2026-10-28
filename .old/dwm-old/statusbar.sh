#!/bin/sh

vol=$(pactl get-sink-volume $(pactl get-default-sink) | awk '$1=="Volume:" {print $5}')

bat=$(upower -i $(upower -e | grep 'BAT') | grep -E "percentage" | tail --bytes +26)

adr=$(ip -json route get 8.8.8.8 | jq -r '.[].prefsrc')

df_check_location='/'

free_output=$(free -h | grep Mem)
df_output=$(df -h $df_check_location | tail -n 1)

MEMUSED=$(echo $free_output | awk '{print $3}')
MEMTOT=$(echo $free_output | awk '{print $2}')

CPU=$(top -bn1 | grep Cpu | awk '{print $2}')%

STOUSED=$(echo $df_output | awk '{print $3}')
STOTOT=$(echo $df_output | awk '{print $2}')
STOPER=$(echo $df_output | awk '{print $5}')

xsetroot -name "[󰀂 ${adr}] [󰂂 ${bat}] [ ${MEMUSED} / ${MEMTOT}] [ ${STOUSED} / ${STOTOT}] [ $(pactl get-sink-volume $(pactl get-default-sink) | awk '$1=="Volume:" {print $5}')] [$(date "+%a %b %d %Y %r")]"
sleep 0.1
