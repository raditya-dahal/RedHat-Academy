#!/bin/bash

echo "===== Backup Mechanism ====="

#ASK for destination path
read -p "Enter the full path of the folder you want to backup: " SOURCE
SOURCE=$(eval echo "$SOURCE")
if [[ ! -d "$SOURCE" ]]; then
    echo "Error: Source folder '$SOURCE' does not exist."
    exit 1
fi

# List all files/folders in source folder immediately
echo
echo "Files in source folder '$SOURCE':"
ls -1A "$SOURCE"
echo

# Ask for destination folder
read -p "Enter the destination folder where backup should be saved: " DEST
DEST=$(eval echo "$DEST")
mkdir -p "$DEST"

# Build list of files
FILES=()
for f in "$SOURCE"/*; do
    BASENAME=$(basename "$f")
    if [[ "$SOURCE/$BASENAME" == "$DEST" ]]; then
        continue
    fi
    FILES+=("$BASENAME")
done

if [[ ${#FILES[@]} -eq 0 ]]; then
    echo "No files found in the source folder."
    exit 0
fi

# Ask for start and end files
read -p "Enter the starting file name : " START_FILE
read -p "Enter the ending file name : " END_FILE

# Determine indexes of start and end files (partial match)
START_IDX=0
END_IDX=$((${#FILES[@]} - 1))
for i in "${!FILES[@]}"; do
    [[ -n "$START_FILE" && "${FILES[i]}" == *"$START_FILE"* ]] && START_IDX=$i
    [[ -n "$END_FILE" && "${FILES[i]}" == *"$END_FILE"* ]] && END_IDX=$i
done

# Swap if needed
if [[ $START_IDX -gt $END_IDX ]]; then
    TEMP=$START_IDX
    START_IDX=$END_IDX
    END_IDX=$TEMP
fi

# Select files to backup
BACKUP_FILES=("${FILES[@]:$START_IDX:$END_IDX-$START_IDX+1}")

if [[ ${#BACKUP_FILES[@]} -eq 0 ]]; then
    echo "No files selected for backup."
    exit 0
fi

# Create zip filename automatically
BACKUP_FILE="$DEST/${BACKUP_FILES[0]}-$(basename "${BACKUP_FILES[-1]}").zip"

# Change to source folder
cd "$SOURCE" || { echo "Failed to change directory to $SOURCE"; exit 1; }

# Create the zip file
zip -r "$BACKUP_FILE" "${BACKUP_FILES[@]}" > /dev/null

# Logging 
LOG_FILE="$DEST/backup_log_$(date +%Y%m%d_%H%M%S).txt"
echo "Backup created: $BACKUP_FILE" > "$LOG_FILE"
for f in "${BACKUP_FILES[@]}"; do echo "$f" >> "$LOG_FILE"; done
echo "Backup completed at $(date)" >> "$LOG_FILE"

# Show success message only
echo
echo "Backup successfully created at: $BACKUP_FILE"
echo "Log saved to: $LOG_FILE"

# Ask to delete original files
read -p "Do you want to delete the original files that were backed up? (y/n): " DELETE_ORIGINAL
if [[ "$DELETE_ORIGINAL" =~ ^[Yy]$ ]]; then
    rm -rf "${BACKUP_FILES[@]}"
    echo "Original files deleted after backup."
else
    echo "Original files kept."
fi

read -p "Press Enter to exit..."