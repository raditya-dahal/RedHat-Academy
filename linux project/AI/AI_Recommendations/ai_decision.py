#!/usr/bin/env python3
import pandas as pd
import os

# Absolute path to your CSV file
EXP_FILE = '/home/binaya/Desktop/linux project/Data_Storage/expenses.csv'

print("===== AI Guided Recommendations =====")

try:
    # Verify file exists
    if not os.path.exists(EXP_FILE):
        raise FileNotFoundError(f"CSV file not found at: {os.path.abspath(EXP_FILE)}")

    # Read CSV
    df = pd.read_csv(EXP_FILE)

    # Clean column names: strip spaces, lowercase, remove BOM
    df.columns = df.columns.str.strip().str.lower().str.replace('\ufeff', '')

    # Verify 'amount' column exists
    if 'amount' not in df.columns:
        raise ValueError("Column 'amount' not found in CSV")

    # Ensure 'amount' is numeric
    df['amount'] = pd.to_numeric(df['amount'], errors='coerce').fillna(0)

    # Calculate total expenses
    total = df['amount'].sum()
    print(f"Total expenses recorded: {total}")

    # Sum expenses by category
    category_totals = df.groupby('category')['amount'].sum()

    # Overall recommendation
    if total > 1000:
        print("Overall: High total expenses! Consider reviewing your spending or cleaning up data.")
    else:
        print("Overall: No urgent actions required.")

    # Category breakdown and suggestions
    print("\nCategory breakdown and suggestions:")
    for cat, amt in category_totals.items():
        print(f"- {cat}: {amt}")
        if amt > 100:
            print(f"  Suggestion: You spent quite a lot on {cat}, consider optimization or freeing related resources.")

except Exception as e:
    print(f"Error reading expenses: {e}")

input("Press Enter to return...")