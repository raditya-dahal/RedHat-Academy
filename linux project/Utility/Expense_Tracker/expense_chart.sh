#!/bin/bash

EXP_FILE="$HOME/Desktop/linux project/Data_Storage/expenses.csv"


if [ ! -f "$EXP_FILE" ]; then
    echo "No expenses recorded yet!"
    read -p "Press Enter to exit..."
    exit 1
fi

echo "===== Personal Expense Tracker ====="

# Run Python to generate pie chart for all expenses
python3 - <<END
import pandas as pd
import matplotlib.pyplot as plt
import os

EXP_FILE = os.path.expanduser("$EXP_FILE")

# Load CSV
df = pd.read_csv(EXP_FILE, names=["Date","User","Category","Description","Amount"])
df['Amount'] = pd.to_numeric(df['Amount'], errors='coerce').fillna(0)

# Group by category
category_totals = df.groupby("Category")["Amount"].sum()

if category_totals.empty:
    print("No expenses recorded!")
else:
    plt.figure(figsize=(6,6))
    plt.pie(category_totals, labels=category_totals.index, autopct="%1.1f%%", startangle=140)
    plt.title("Expense Summary by Category")
    plt.show()
END