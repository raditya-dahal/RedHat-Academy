#!/bin/bash

OUTPUT_DIR="./Data_Storage/Web_Scraper"
mkdir -p "$OUTPUT_DIR"

echo "===== Web Scraper & Notification ====="

read -p "Enter URL to fetch: " URL

read -p "Enter keyword/phrase to search for: " KEYWORD

read -p "Enter output CSV file name (without extension): " FILENAME

OUTPUT_FILE="$OUTPUT_DIR/${FILENAME}.csv"

CONTENT=$(curl -s "$URL")

echo "Line,Match" > "$OUTPUT_FILE"
echo "$CONTENT" | grep -n -o "$KEYWORD" | while IFS=: read -r LINE MATCH; do
    echo "$LINE,$MATCH" >> "$OUTPUT_FILE"
done

echo "All occurrences of '$KEYWORD' saved in $OUTPUT_FILE"

# Optional desktop notification
read -p "Send desktop notification that scraping is done? (y/n): " NOTIFY
if [[ "$NOTIFY" == "y" || "$NOTIFY" == "Y" ]]; then
    notify-send "Web Scraper" "Scraping completed for '$KEYWORD'. Results saved to $OUTPUT_FILE"
fi