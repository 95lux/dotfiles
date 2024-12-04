#!/bin/bash

# Set up adb reverse command
echo "Setting up adb reverse..."
adb reverse tcp:5901 tcp:5900

# Create headless output using hyprctl
echo "Creating headless output..."
hyprctl output create headless

# Find the first available HEADLESS display
headless_display=$(hyprctl monitors | grep -o 'HEADLESS-[0-9]*' | head -n 1)

echo "Starting wayvnc..."
wayvnc localhost -o "$headless_display" &

# Enable the monitor using hyprctl
echo "Enabling the monitor $headless_display..."
hyprctl keyword monitor "$headless_display",1800x1080@60,1920x0,1.5

