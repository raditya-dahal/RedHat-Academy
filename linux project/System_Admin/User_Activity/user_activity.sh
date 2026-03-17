#!/bin/bash

echo "===== User Activity Tracker ====="

DEST_FOLDER="/home/binaya/Desktop/linux project/Data_Storage/logs"
mkdir -p "$DEST_FOLDER"

# Name the log file with timestamp
LOG_FILE="$DEST_FOLDER/user_activity_$(date +%Y%m%d_%H%M%S).txt"

#Output
{
    echo "===== User Activity Tracker ====="
    echo
    echo "Timestamp: $(date)"
    echo
    echo "Currently logged in users:"
    who
    echo
    echo "Last 10 logins:"
    last -n 10
    echo
    echo "Last 10 commands for current user:"
    history | tail -n 10
} > "$LOG_FILE"

# Show confirmation
echo
echo "User activity report saved to: $LOG_FILE"
read -p "Press Enter to return..."