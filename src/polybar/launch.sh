#!/usr/bin/env bash



polybar-msg cmd quit
echo "---" | tee -a /tmp/polybar1.log
polybar mainbar 2>&1 | tee -a /tmp/polybar1.log & disown
