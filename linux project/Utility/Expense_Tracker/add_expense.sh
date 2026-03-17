#!/bin/bash

# Logged-in user/admin
USER_ARG=$1

EXP_FILE="$HOME/Desktop/linux project/Data_Storage/expenses.csv"

mkdir -p "$(dirname "$EXP_FILE")"

while true; do
    echo "===== Add New Expense ====="
    echo "Select expense type:"
    echo "1) Food"
    echo "2) Transport"
    echo "3) Entertainment"
    echo "4) Bills"
    echo "5) Other"
    read -p "Enter number: " TYPE_CHOICE

    case $TYPE_CHOICE in
        1) TYPE="Food";;
        2) TYPE="Transport";;
        3) TYPE="Entertainment";;
        4) TYPE="Bills";;
        5) TYPE="Other";;
        *) TYPE="Other";;
    esac

    read -p "Enter expense description: " DESC
    read -p "Enter amount: " AMOUNT

    DATE=$(date +%Y-%m-%d)
    # ✅ Quotes around path
    echo "$DATE,$USER_ARG,$TYPE,$DESC,$AMOUNT" >> "$EXP_FILE"

    echo
    echo "===== Expense Added ====="
    echo "Date       : $DATE"
    echo "User       : $USER_ARG"
    echo "Category   : $TYPE"
    echo "Description: $DESC"
    echo "Amount     : $AMOUNT"
    echo "========================"
    echo

    read -p "Do you want to add another expense? (y/n): " ADD_MORE
    case $ADD_MORE in
        [Yy]* ) continue;;
        * ) break;;
    esac
done