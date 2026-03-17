#!/usr/bin/env python3
import pandas as pd
from pathlib import Path
import sys


PROJECT_ROOT = Path(__file__).parent.parent.parent.resolve()


DISK_FILE = PROJECT_ROOT / "Data_Storage" / "disk_history.csv"
EXPENSE_FILE = PROJECT_ROOT / "Data_Storage" / "expenses.csv"

args = sys.argv[1:]

if "--disk" in args:
    print("\n===== Disk Usage History =====\n")
    if DISK_FILE.exists():
        df = pd.read_csv(DISK_FILE)
        print(df.tail())
    else:
        print("No disk history data found.")

elif "--expense" in args:
    print("\n===== Expense Report =====\n")
    if EXPENSE_FILE.exists():
        df = pd.read_csv(EXPENSE_FILE)
        print(df.tail())
    else:
        print("No expense data found.")

else:
    print("Please select --disk or --expense")