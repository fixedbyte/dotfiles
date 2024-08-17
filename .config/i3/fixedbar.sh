#!/bin/sh

# Header that will tell i3bar what JSON version will use:
echo '{ "version": 1, "click_events": true }'
# Begin the endless array
echo '['
# Start the loop simpler
echo '[]'
# Infinite loop, calls every second the system command _date_
while :; do
    echo ",["
    echo -n "{"
    echo -n "\"full_text\":\"\","
    echo -n "\"border_left\":0,"
    echo -n "\"border_right\":0,"
    echo -n "\"border_top\":0,"
    echo -n "\"border_bottom\":0,"
    echo -n "\"color\":\"#ff0000\","
    echo -n "\"separator\": false,"
    echo -n "\"separator_block_width\": 0"
    echo -n "},"
    echo -n "{"
    echo -n "\"name\": \"time\","
    echo -n "\"full_text\": \"$(date)\","
    echo -n "\"background\": \"#ff0000\","
    echo -n "\"border_top\":2,"
    echo -n "\"border_bottom\":2,"
    echo -n "\"border_right\":0,"
    echo -n "\"border_left\":0,"
    echo -n "\"separator\": false,"
    echo -n "\"separator_block_width\": 0"
    echo -n "}"
    echo "]"
    sleep 1
done
