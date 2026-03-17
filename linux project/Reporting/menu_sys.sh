#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

while true; do
    clear
    echo "===== Reporting Menu ====="
    echo "1) View Disk Usage History"
    echo "2) View Expense Report"
    echo "3) Back to Main Menu"
    read -p "Select report: " REPORT_CHOICE

    case $REPORT_CHOICE in
        1)
            python3 -u "$SCRIPT_DIR/generate_report/generate_report.py" --disk
            ;;
        2)
            python3 -u "$SCRIPT_DIR/generate_report/generate_report.py" --expense
            ;;
        3)
            break
            ;;
        *)
            echo "Invalid choice"
            sleep 1
            ;;
    esac

    echo
    read -p "Press Enter to return to Reporting Menu..."
done