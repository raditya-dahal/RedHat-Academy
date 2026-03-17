#!/bin/bash

# Get script directory to make paths work anywhere
SCRIPT_DIR=$(dirname "$(realpath "$0")")

USERNAME=$1
ROLE=$2

echo "===== System Administration Modules ====="
echo "1) System Update"
echo "2) System Health Monitoring"
echo "3) Log Analyzer"
echo "4) File Organizer"
echo "5) Backup Mechanism"
echo "6) User Activity Tracker"
echo "7) Create User (Admin only)"
read -p "Select module: " SYS_CHOICE

case $SYS_CHOICE in
    1)
        if [[ "$ROLE" == "ADMIN" ]]; then
            "$SCRIPT_DIR/System_Update/update.sh"
        else
            echo "Access denied! Only Admin can update system."
        fi
        ;;
    2)
        "$SCRIPT_DIR/Health_Monitor/monitor.sh"
        ;;
    3)
        if [[ "$ROLE" == "ADMIN" ]]; then
            "$SCRIPT_DIR/Log_Analyzer/log_analyzer.sh"
        else
            echo "Access denied! Only Admin can view logs."
        fi
        ;;
    4)
        "$SCRIPT_DIR/File_Organizer/file_organizer.sh"
        ;;
    5)
        if [[ "$ROLE" == "ADMIN" ]]; then
            "$SCRIPT_DIR/Backup/backup.sh"
        else
            echo "Access denied! Only Admin can run backups."
        fi
        ;;
    6)
        "$SCRIPT_DIR/User_Activity/user_activity.sh"
        ;;
    7)
        if [[ "$ROLE" == "ADMIN" ]]; then
            "$SCRIPT_DIR/create_user.sh"
        else
            echo "Access denied! Only Admin can create users."
        fi
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

read -p "Press Enter to return..."