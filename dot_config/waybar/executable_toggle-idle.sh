#!/usr/bin/env bash

pkill hypridle || hypridle
kill -SIGRTMIN+10 $(pgrep waybar)
