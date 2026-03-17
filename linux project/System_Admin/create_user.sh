#!/bin/bash

USERS_DB="./Data_Storage/users.db"
ADMINS_DB="./Data_Storage/admins.db"

echo "=== Create New Account ==="
read -p "Enter new username: " NEW_USER
read -s -p "Enter password for new user: " NEW_PASS
echo
echo "Select account type:"
echo "1) Admin"
echo "2) Normal User"
read -p "Choice [1-2]: " TYPE_CHOICE

case $TYPE_CHOICE in
    1)
        # Add to admins database
        echo "$NEW_USER:$NEW_PASS" >> "$ADMINS_DB"
        echo "Admin user $NEW_USER created successfully!"
        ;;
    2)
        # Add to normal users database
        echo "$NEW_USER:$NEW_PASS" >> "$USERS_DB"
        echo "User $NEW_USER created successfully!"
        ;;
    *)
        echo "Invalid choice. No user created."
        ;;
esac