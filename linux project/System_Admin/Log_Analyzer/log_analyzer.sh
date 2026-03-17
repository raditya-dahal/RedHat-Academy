#!/bin/bash

if [[ -n "$1" ]]; then
    PROJECT_ROOT="$1"
else
    PROJECT_ROOT=$(dirname "$(dirname "$(dirname "$(realpath "$0")")")")
fi

LOG_DIR="$PROJECT_ROOT/Data_Storage/logs"
LOG_FILE="$LOG_DIR/system.log"

echo "===== Log Analyzer ====="

if [[ ! -d "$LOG_DIR" ]]; then
    echo "Creating log directory: $LOG_DIR"
    mkdir -p "$LOG_DIR"
fi

if [[ ! -f "$LOG_FILE" ]]; then
    echo "Creating log file: $LOG_FILE"
    touch "$LOG_FILE"
fi

TOTAL_LINES=$(wc -l < "$LOG_FILE")
ERRORS=$(grep -c "ERROR" "$LOG_FILE")
WARNINGS=$(grep -c "WARNING" "$LOG_FILE")

echo "Total lines: $TOTAL_LINES"
echo "Errors: $ERRORS"
echo "Warnings: $WARNINGS"