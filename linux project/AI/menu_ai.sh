#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "===== AI Modules ====="
echo "1) Disk Usage Prediction"
echo "2) AI Guided Recommendations"
read -p "Select module: " AI_CHOICE

case $AI_CHOICE in
    1)
        python3 "$SCRIPT_DIR/Disk_Prediction/ai_predict.py"
        ;;
    2)
        python3 "$SCRIPT_DIR/AI_Recommendations/ai_decision.py"
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

read -p "Press Enter to return..."