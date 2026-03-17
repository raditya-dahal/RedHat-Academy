#!/usr/bin/env python3
import pandas as pd
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent

# Path to disk_history.csv
DISK_HISTORY_FILE = (BASE_DIR / "../../Data_Storage/disk_history.csv").resolve()

try:
    df = pd.read_csv(DISK_HISTORY_FILE)
    df['diff'] = df['usage'].diff().fillna(0)
    predicted = df['usage'].iloc[-1] + df['diff'].mean()
    print(f"Predicted disk usage next period: {predicted:.2f}%")
except FileNotFoundError:
    print(f"Error: File not found at {DISK_HISTORY_FILE}")
except Exception as e:
    print(f"Error reading disk history: {e}")