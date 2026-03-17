#!/bin/bash

EXP_FILE="../../Data_Storage/expenses.csv"
mkdir -p ../../Data_Storage

echo "===== Personal Expense Tracker ====="


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

echo "$(date +%Y-%m-%d),$TYPE,$DESC,$AMOUNT" >> "$EXP_FILE"
echo "Expense added!"

# Ask if user wants to view pie chart
read -p "View expense summary as pie chart? (y/n): " VIEW_CHART
if [[ "$VIEW_CHART" == "y" || "$VIEW_CHART" == "Y" ]]; then
    python3 expense_chart.py
fi

read -p "Press Enter to exit..."