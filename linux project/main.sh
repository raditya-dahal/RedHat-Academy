#!/bin/bash
# Main Controller

USERS_DB="./Data_Storage/users.db"
ADMINS_DB="./Data_Storage/admins.db"

read -p "Username: " USERNAME
read -s -p "Password: " PASSWORD
echo

ROLE=""

# Check Admins
while IFS=: read -r u p; do
    if [[ "$USERNAME" == "$u" && "$PASSWORD" == "$p" ]]; then
        ROLE="ADMIN"
        break
    fi
done < "$ADMINS_DB"

# Check Users if not admin
if [[ -z "$ROLE" ]]; then
    while IFS=: read -r u p; do
        if [[ "$USERNAME" == "$u" && "$PASSWORD" == "$p" ]]; then
            ROLE="USER"
            break
        fi
    done < "$USERS_DB"
fi

if [[ -z "$ROLE" ]]; then
    echo "Invalid credentials!"
    exit 1
fi

echo "Login successful! Role: $ROLE"
sleep 1

while true; do
    echo "===== Main Menu ====="
    echo "1) System Administration"
    echo "2) Utility Modules"
    echo "3) AI Modules"
    echo "4) Reporting"
    echo "5) Exit"
    read -p "Select: " MAIN_CHOICE

    case $MAIN_CHOICE in
        1) ./System_Admin/menu_sys.sh "$USERNAME" "$ROLE" ;;
        2) ./Utility/menu_util.sh "$USERNAME" "$ROLE" ;;
        3) ./AI/menu_ai.sh "$USERNAME" "$ROLE" ;;
        4) ./Reporting/menu_sys.sh ;;         
        5) echo "Goodbye!"; exit 0 ;;
        *) echo "Invalid choice"; sleep 1 ;;
    esac

    clear 
done