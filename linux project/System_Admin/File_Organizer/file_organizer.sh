#!/bin/bash

echo "===== File Organizer ====="

# Ask user for the directory to organize
read -p "Enter the full path of the directory you want to organize: " TARGET_DIR

# Validate directory
if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Directory does not exist. Creating it..."
    mkdir -p "$TARGET_DIR"
fi

# Ask user for folder base name or keep as extension folders
read -p "Do you want to create a folder per file type extension? (y/n): " EXT_FOLDER_CHOICE

# Organize files
for file in "$TARGET_DIR"/*; do
    [[ -f $file ]] || continue   

    EXT="${file##*.}" 

    if [[ "$EXT_FOLDER_CHOICE" =~ ^[Yy]$ ]]; then
        # Folder name = extension
        DEST="$TARGET_DIR/$EXT"
    else
        # Ask user for folder name based on file type group
        case "$EXT" in
            jpg|png|gif|jpeg) DEST="$TARGET_DIR/Images" ;;
            pdf|docx|txt|xls|csv) DEST="$TARGET_DIR/Documents" ;;
            mp4|mkv|avi|mov) DEST="$TARGET_DIR/Videos" ;;
            *) DEST="$TARGET_DIR/Others" ;;
        esac
    fi

    mkdir -p "$DEST"

    mv "$file" "$DEST/"
done

echo "Files organized successfully in $TARGET_DIR!"

read -p "Press Enter to return..."
