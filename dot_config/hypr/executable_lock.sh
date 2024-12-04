#!/usr/bin/env bash

swayidle -w timeout 600 "hyprlock" before-sleep "hyprlock" & # lock screen after 10 min of idle
swayidle -w timeout 1200 "systemctl hibernate" &             # hibernate after 20 mins of idle

