#!/bin/bash
echo "Updating system..."
sudo apt update && sudo apt upgrade -y
echo "Done!"
read -p "Press Enter..."