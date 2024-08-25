#!/bin/sh
# Variables

# Functions
function common {
    echo -n "\"separator\":false,"
    echo -n "\"separator_block_width\":0,"
    echo -n "\"border_top\":0,"
    echo -n "\"border_bottom\":0,"
    echo -n "\"border_right\":0,"
    echo -n "\"border_left\":0"
}

function colon {
    echo -n ","
}

function separator {
    echo -n "{"
    echo -n "\"full_text\":\"\","
    echo -n "\"color\":\"#ff0000\","
    common
    echo -n "}"
    colon
}

function get_date {
    separator
    echo -n "{"
    echo -n "\"name\":\"time\","
    echo -n "\"full_text\":\" $(date "+%a %D %T") \","
    echo -n "\"background\":\"#ff0000\","
    common
    echo -n "}"
}

# Header that will tell i3bar what JSON version will use:
echo '{ "version": 1, "click_events": true }'
# Begin the endless array
echo '['
# Start the loop simpler
echo '[]'
# Infinite loop
while :; do
    echo -n ",["
    get_date
#    separator
    echo -n "]"
    sleep 1
done &
while read line; do
    if [[ $line == *"name"*"time"* ]]; then
        alacritty --class calendar_event -e $HOME/.config/i3/calendar_event.sh
    fi
done
