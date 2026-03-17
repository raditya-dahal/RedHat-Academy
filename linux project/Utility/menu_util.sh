#!/bin/bash
USERNAME=$1
ROLE=$2

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "===== Utility Modules ====="
echo "1) Add Expense"
echo "2) Personal Expense Tracker (View Graph)"
echo "3) Web Scraper & Notification"
read -p "Select module: " UTIL_CHOICE

case $UTIL_CHOICE in
    1)
        if [[ "$ROLE" == "admin" ]]; then

            "$SCRIPT_DIR/Expense_Tracker/add_expense.sh" "admin"
        else
            "$SCRIPT_DIR/Expense_Tracker/add_expense.sh" "$USERNAME"
        fi
        ;;
    2)
        "$SCRIPT_DIR/Expense_Tracker/expense_chart.sh"
        ;;
    3)
        "$SCRIPT_DIR/Web_Scraper/web_scraper.sh"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

read -p "Press Enter to return..."