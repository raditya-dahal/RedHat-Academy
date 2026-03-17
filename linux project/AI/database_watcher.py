#!/usr/bin/env python3
import pandas as pd
from pathlib import Path
import sys


# Folder where this script is located (AI/)
AI_FOLDER = Path(__file__).parent.resolve()

# Data_Storage folder is a sibling of AI/
DATA_FOLDER = AI_FOLDER.parent / "Data_Storage"

DISK_FILE = DATA_FOLDER / "disk_history.csv"
EXPENSE_FILE = DATA_FOLDER / "expenses.csv"


DISK_COLUMNS = ["date", "usage", "memory", "disk"]
EXPENSE_COLUMNS = ["date", "user", "category", "item", "amount"]


def fix_disk_history():
    try:
        df = pd.read_csv(DISK_FILE, on_bad_lines='skip')
        df_columns = [c.lower().strip() for c in df.columns]
        col_map = {df_columns[i]: DISK_COLUMNS[i] for i in range(min(len(df_columns), len(DISK_COLUMNS)))}
        df = df.rename(columns=col_map)
        # Add missing columns
        for col in DISK_COLUMNS:
            if col not in df.columns:
                df[col] = ""
        # Reorder columns
        df = df[DISK_COLUMNS]
        df.to_csv(DISK_FILE, index=False)
        print("Disk history fixed.", flush=True)
    except FileNotFoundError:
        print(f"Disk history file not found: {DISK_FILE}", flush=True)
    except Exception as e:
        print(f"Error fixing disk history: {e}", flush=True)


def fix_expenses():
    try:
        df = pd.read_csv(EXPENSE_FILE, on_bad_lines='skip')
        df_columns = [c.lower().strip() for c in df.columns]
        col_map = {}
        for col in df_columns:
            if "date" in col:
                col_map[col] = "date"
            elif "user" in col:
                col_map[col] = "user"
            elif "category" in col:
                col_map[col] = "category"
            elif "item" in col or "notes" in col:
                col_map[col] = "item"
            elif "amount" in col:
                col_map[col] = "amount"
        df = df.rename(columns=col_map)
        # Add missing columns
        for col in EXPENSE_COLUMNS:
            if col not in df.columns:
                df[col] = "admin" if col == "user" else ""
        # Reorder columns
        df = df[EXPENSE_COLUMNS]
        df.to_csv(EXPENSE_FILE, index=False)
        print("Expenses fixed.", flush=True)
    except FileNotFoundError:
        print(f"Expenses file not found: {EXPENSE_FILE}", flush=True)
    except Exception as e:
        print(f"Error fixing expenses: {e}", flush=True)


def main():
    print("Starting CSV watcher...", flush=True)
    fix_disk_history()
    fix_expenses()
    print("CSV watcher finished.", flush=True)


if __name__ == "__main__":
    main()