#!/bin/bash

CSV_FILE="/home/binaya/Desktop/linux project/Data_Storage/disk_history.csv"

if [ ! -f "$CSV_FILE" ]; then
    echo "Timestamp,CPU_Usage,Memory_Usage,Disk_Usage" > "$CSV_FILE"
fi

# Gather system stats
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
MEM_USAGE=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print $5}')
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")

# Append to CSV
echo "$TIMESTAMP,$CPU_USAGE,$MEM_USAGE,$DISK_USAGE" >> "$CSV_FILE"

# Output
echo "Recorded the following to $CSV_FILE:"
echo "Timestamp: $TIMESTAMP"
echo "CPU Usage: $CPU_USAGE%"
echo "Memory Usage: $MEM_USAGE%"
echo "Disk Usage: $DISK_USAGE"

read -p "Press Enter to exit..."