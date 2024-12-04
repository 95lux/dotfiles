#!/bin/bash

# Function to stop wayvnc process
stop_wayvnc() {
    # Find the wayvnc process ID
    wayvnc_pid=$(pgrep wayvnc)
    if [ -n "$wayvnc_pid" ]; then
        echo "Stopping wayvnc (PID: $wayvnc_pid)..."
        kill "$wayvnc_pid"
    fi
}

# Stop wayvnc process
stop_wayvnc

# Remove headless outputs with the given syntax
echo "Removing headless outputs..."
hyprctl monitors | grep -o 'HEADLESS-[0-9]*' | while read -r monitor_id; do
    hyprctl output remove "$monitor_id"
done


